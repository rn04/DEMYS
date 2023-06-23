package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.CalendarRepository;
import com.ducks.demys.boot.vo.Calendar;


@Service
public class CalendarService {
   public CalendarRepository calendarRepository;

   public CalendarService(CalendarRepository calendarRepository) {
      this.calendarRepository = calendarRepository;
   }

   public List<Calendar> getCalendarList(int MEMBER_NUM) {
      return calendarRepository.getCalendarList(MEMBER_NUM);
    }
   
   public Calendar getCalendardetail(int SC_NUM) {
      
      return calendarRepository.getCalendardetail(SC_NUM);
   }
   
    public void registCalendar(Calendar sc) {
       sc.setSC_NUM(calendarRepository.selectCalendarSequenceNextValue());

           calendarRepository.registGo(sc);
       }

   public void removeCalendar(int SC_NUM) {
      calendarRepository.removeCalendar(SC_NUM);
   }
   
   public List<Calendar> getModal_PJList(int MEMBER_NUM) {
      return calendarRepository.getModal_PJList(MEMBER_NUM);
    }
   public void modifyCalendar(Calendar sc) {

       calendarRepository.modifyCalendar(sc);
       
   }





   
}