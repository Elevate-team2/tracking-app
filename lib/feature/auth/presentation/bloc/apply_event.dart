abstract class ApplyDriverEvent {}

class ApplyDriverSubmitted extends ApplyDriverEvent {
  final Map<String, dynamic> body;
  ApplyDriverSubmitted(this.body);
}
