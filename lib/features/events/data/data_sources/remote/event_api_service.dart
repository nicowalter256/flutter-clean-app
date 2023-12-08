import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
import '../../models/event.dart';
part 'event_api_service.g.dart';

@RestApi(baseUrl: baseURL)
abstract class EventsApiService {
  factory EventsApiService(Dio dio) = _EventsApiService;

  @GET('events')
  Future<HttpResponse<List<EventModel>>> getEvents();
}
