@extends('layouts.admin')
@push('css')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css">
@endpush
@section('content')
    <div id="calendar"></div>
    @include('backend.includes.modals')
@endsection

@push('js')
    <script src="{{asset('vendor/fullcalendar/moment.min.js')}}"></script>
    <script src="{{asset('vendor/fullcalendar/fullcalendar.min.js')}}"></script>
    <script>
        $(document).ready(function(){
            //moment.locale('{{app()->getLocale()}}');
            //console.log(moment(Date.now()).fromNow()); //vor ein paar Sekunden

            $('#calendar').fullCalendar({
               defaultView: "agendaWeek",
               //firstDay: 6,
               direction: '{{ langDir() }}',
               buttonText: {
                   prev: "السابق",
                   next: "التالي",
                   today: "اليوم",
                   month: "شهر",
                   week: "أسبوع",
                   day: "يوم",
                   list: "أجندة"
               },
               weekText: "أسبوع",
               allDayText: "اليوم كله",
               moreLinkText: "أخرى",
               noEventsText: "أي أحداث لعرض",
               monthNamesShort: ['{{__('backend.Ene')}}','{{__('backend.Feb')}}','{{__('backend.Mar')}}','{{__('backend.Abr')}}','{{__('backend.May')}}','{{__('backend.Jun')}}','{{__('backend.Jul')}}','{{__('backend.Ago')}}','{{__('backend.Sep')}}','{{__('backend.Oct')}}','{{__('backend.Nov')}}','{{__('backend.Dic')}}'],
               dayNamesShort: ['{{__('backend.Sun')}}', '{{__('backend.Mon')}}', '{{__('backend.Tue')}}', '{{__('backend.Wed')}}', '{{__('backend.Thu')}}', '{{__('backend.Fri')}}', '{{__('backend.Sat')}}'],
               events: [
                 @foreach($appointments as $appointment)
                   {
                        start: '{{ $appointment->date.' '.$appointment->start }}',
                        end: '{{ $appointment->date.' '.$appointment->end }}'
                   },
                   @endforeach

               ],
           });
        });
    </script>
@endpush
