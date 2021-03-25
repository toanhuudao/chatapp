import consumer from "./consumer"

consumer.subscriptions.create({channel: "RoomChannel", room_id: 7}, {
    connected() {
        // Called when the subscription is ready for use on the server
        console.log("connected");

    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {
        // Called when there's incoming data on the websocket for this channel
        const element = document.getElementById("user-id");
        const user_id = Number(element.getAttribute("data-user-id"));
        console.log(user_id)
        console.log(data.message)
        let html;
        if (user_id == data.message.user_id) {
            html = data.mine;
        } else {
            html = data.theirs;
        }
        const mess = document.getElementById('messages')
        mess.innerHTML = mess.innerHTML +html
    }
});
