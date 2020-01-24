package com.jk.ktMembership;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class BioRithm {

    private static final int VALUE_OF_BIORHYTHM_PHYSICAL = 23;
    private static final int VALUE_OF_BIORHYTHM_EMOTIONAL = 28;
    private static final int VALUE_OF_BIORHYTHM_INTELLECTUAL = 33;

//    public static void main(String[] args) throws Exception{
//        Date date = new Date();
//        BioRithm bio = new BioRithm();
//        bio.displayPieChart("19740610",date);
//    }

    public ArrayList<Map<String,Object>> displayPieChart(String birthDay, Date today) {
        Map<String,Object> mapSindex = new HashMap<>();
        mapSindex.put("phsical",VALUE_OF_BIORHYTHM_PHYSICAL);
        mapSindex.put("emotional",VALUE_OF_BIORHYTHM_EMOTIONAL);
        mapSindex.put("intellectual",VALUE_OF_BIORHYTHM_INTELLECTUAL);
        ArrayList<Map<String,Object>> mapSinRslt = getBiorhythm(birthDay, today, mapSindex,"");
        mapSinRslt.stream().forEach( map -> System.out.println(map.toString()));
        return mapSinRslt;
    }
    private Map<String,Object> getBiorhythm(String birthday, Date date, Map<String,Object> type) {
        Map<String,Object> bioRslt = new HashMap<>();
        Map<String,Object> mapRslt = new HashMap<>();

        type.entrySet().forEach((entry) -> {
            float fbioIdx =getBiorhythm(birthday, date,(Integer)entry.getValue());
            bioRslt.put(entry.getKey(), fbioIdx);
        });
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
        String strDay = sf.format(date);
        mapRslt.put(strDay,bioRslt);

        return mapRslt;
    }
    private ArrayList<Map<String,Object>> getBiorhythm(String birthday, Date date, Map<String,Object> type, String bioKind) {
        Map<String,Object> bioRslt = new HashMap<>();
        ArrayList<Map<String,Object>> arrayList = new ArrayList<>();

        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
        int year = Integer.parseInt(sf.format(date).substring(0,4));
        int month = Integer.parseInt(sf.format(date).substring(4,6));
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month); //입력받은 월로 세팅
        cal.set(year,month-1,1); //입력받은 월의 1일로 세팅
        int end = cal.getActualMaximum(Calendar.DATE); //해당 월 마지막 날짜
        for(int i=1; i<=end; i++) {
            //System.out.println(sf.format(cal.getTime()));
            Date bioDate = cal.getTime();
            bioRslt = getBiorhythm(birthday, bioDate, type);
            arrayList.add(bioRslt);
            cal.add(Calendar.DATE,1);
        }

        return arrayList;
    }
    private float getBiorhythm(String birthday, Date today, int type) {
        if(today == null) {
            today = new Date();
        }

        Date birthDate = null;

        if(birthday == null || birthday.length() != 8) {
            birthDate = today;
        } else {
            try {
                birthDate = new SimpleDateFormat("yyyyMMdd").parse(birthday);
            } catch (ParseException e) {
                birthDate = today;
            }
        }
        final long mTDV = (60 * 60 * 24 * 1000);
        final double mPI = 3.14159;

        double livedDays = (today.getTime() - birthDate.getTime()) / mTDV;
        double p = (Math.sin((livedDays / type) * 2.0 * mPI) * 100.0);

        BigDecimal bd = new BigDecimal(p);
        bd = bd.setScale(0, BigDecimal.ROUND_HALF_EVEN);

        return bd.floatValue();
    }




}