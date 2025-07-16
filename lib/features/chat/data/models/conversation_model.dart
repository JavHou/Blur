class ConversationModel {
  final String id;
  final String name;
  final String avatar;
  final String lastMessage;
  final int unreadMessages;
  final String lastMessageTime;
  final String status;

  ConversationModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.lastMessage,
    required this.unreadMessages,
    required this.lastMessageTime,
    required this.status,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      lastMessage: json['lastMessage'] as String,
      unreadMessages: json['unreadMessages'] as int,
      lastMessageTime: json['lastMessageTime'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'lastMessage': lastMessage,
      'unreadMessages': unreadMessages,
      'lastMessageTime': lastMessageTime,
      'status': status,
    };
  }
}

List<ConversationModel> conversations = [
  ConversationModel(
    id: '1',
    name: 'John Doe',
    avatar: 'https://images.unsplash.com/photo-1562322140-8baeececf3df?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c2Fsb258ZW58MHx8MHx8fDA%3D',
    lastMessage: 'Hi! Is the apartment at 123 Main St still available?',
    unreadMessages: 2,
    lastMessageTime: '12:00 PM',
    status: "ongoing",
  ),
  ConversationModel(
    id: '2',
    name: 'Sarah Realtor',
    avatar: 'https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2Fsb258ZW58MHx8MHx8fDA%3D',
    lastMessage: 'The open house is scheduled for Saturday at 2 PM.',
    unreadMessages: 0,
    lastMessageTime: '11:00 AM',
    status: "ongoing",
  ),
  ConversationModel(
    id: '3',
    name: 'Emily Smith',
    avatar: 'https://images.unsplash.com/photo-1629397685944-7073f5589754?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHNhbG9ufGVufDB8fDB8fHww',
    lastMessage: 'Thank you for the tour yesterday!',
    unreadMessages: 0,
    lastMessageTime: '10:00 AM',
    status: "finished",
  ),
  ConversationModel(
    id: '4',
    name: 'Michael Agent',
    avatar: 'https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHNhbG9ufGVufDB8fDB8fHww',
    lastMessage: 'Please bring your ID for the lease signing.',
    unreadMessages: 0,
    lastMessageTime: '10:00 AM',
    status: "finished",
  ),
  ConversationModel(
    id: '5',
    name: 'Olivia Tenant',
    avatar: 'https://images.unsplash.com/photo-1522337094846-8a818192de1f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fHNhbG9ufGVufDB8fDB8fHww',
    lastMessage: 'I have a question about the rental agreement.',
    unreadMessages: 2,
    lastMessageTime: '1, March',
    status: "finished",
  ),
  ConversationModel(
    id: '6',
    name: 'David Broker',
    avatar: 'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzh8fHNhbG9ufGVufDB8fDB8fHww',
    lastMessage: 'Your application has been approved.',
    unreadMessages: 0,
    lastMessageTime: '10:00 AM',
    status: "finished",
  ),
  ConversationModel(
    id: '7',
    name: 'Sophia Landlord',
    avatar: 'https://plus.unsplash.com/premium_photo-1664048712891-f9b6b0c62369?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDl8fHNhbG9ufGVufDB8fDB8fHww',
    lastMessage: 'Will you need parking with your lease?',
    unreadMessages: 0,
    lastMessageTime: '10:00 AM',
    status: "finished",
  ),
  ConversationModel(
    id: '8',
    name: 'James Buyer',
    avatar: 'https://images.unsplash.com/photo-1535637603896-07c179d71103?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTR8fHNhbG9ufGVufDB8fDB8fHww',
    lastMessage: 'Looking forward to the property inspection tomorrow.',
    unreadMessages: 0,
    lastMessageTime: '10:00 AM',
    status: "finished",
  ),
  ConversationModel(
    id: '9',
    name: 'Anna Renter',
    avatar: 'https://images.unsplash.com/photo-1512496015851-a90fb38ba796?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjB8fHNhbG9ufGVufDB8fDB8fHww',
    lastMessage: 'Is the pet policy flexible?',
    unreadMessages: 0,
    lastMessageTime: '10:00 AM',
    status: "cancelled",
  ),
];
