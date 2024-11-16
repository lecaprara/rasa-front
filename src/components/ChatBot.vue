<template>
  <div class="chat-container">
    <div class="messages">
      <div
        v-for="(message, index) in messages"
        :key="index"
        :class="['message', message.sender]"
      >
        <span>{{ message.text }}</span>
      </div>
    </div>
    <input
      v-model="userMessage"
      @keyup.enter="sendMessage"
      placeholder="Type a message..."
    />
    <button @click="sendMessage">Send</button>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      userMessage: "",
      messages: [],
    };
  },
  methods: {
    async sendMessage() {
      if (!this.userMessage.trim()) return;

      this.messages.push({ sender: "user", text: this.userMessage });

      try {
        const response = await axios.post("http://localhost:5005/webhooks/rest/webhook", {
          sender: "user",
          message: this.userMessage,
        });

        response.data.forEach((reply) => {
          this.messages.push({ sender: "bot", text: reply.text });
        });
      } catch (error) {
        console.error("Error sending message:", error);
        this.messages.push({ sender: "bot", text: "Oops! Something went wrong." });
      }

      this.userMessage = "";
    },
  },
};
</script>

<style>
.chat-container {
  width: 300px;
  max-height: 500px;
  border: 1px solid #ddd;
  padding: 10px;
  display: flex;
  flex-direction: column;
}

.messages {
  flex-grow: 1;
  overflow-y: auto;
  margin-bottom: 10px;
}

.message {
  margin: 5px 0;
}

.message.user {
  text-align: right;
  color: blue;
}

.message.bot {
  text-align: left;
  color: green;
}

input {
  padding: 5px;
  border: 1px solid #ddd;
  width: calc(100% - 12px);
  margin-bottom: 5px;
}

button {
  padding: 5px 10px;
}
</style>
