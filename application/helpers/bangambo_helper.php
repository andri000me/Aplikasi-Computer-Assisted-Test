<?php

if (!function_exists('get_current_date'))
{
    function get_current_date()
    {
        $arr_days   = [
            'Senin',
            'Selasa',
            'Rabu',
            'Kamis',
            'Jumat\'at',
            'Sabtu',
            'Minggu',
        ];
        $arr_months = [
            'Januari',
            'Februari',
            'Maret',
            'April',
            'Mei',
            'Juni',
            'Juli',
            'Agustus',
            'September',
            'Oktober',
            'November',
            'Desember',
        ];
        $today      = $arr_days[date('N') - 1];
        $month      = $arr_months[date('n') - 1];
        $date       = date('j');
        $year       = date('Y');

        return $today . ', ' . $date . ' ' . $month . ' ' . $year;
    }
}

if (!function_exists('date_to_indo_format'))
{
    function date_to_indo_format($dt)
    {
        $date       = substr($dt, 8, 2);
        $arr_months = [
            'Januari',
            'Februari',
            'Maret',
            'April',
            'Mei',
            'Juni',
            'Juli',
            'Agustus',
            'September',
            'Oktober',
            'November',
            'Desember',
        ];
        $month      = $arr_months[substr($date, 5, 2) - 1];
        $year       = substr($tgl, 0, 4);

        return $date . ' ' . $month . ' ' . $year;
    }
}

if (!function_exists('date_format_dash'))
{
    function date_format_dash($date)
    {
        $split  = explode('/', $date);
        $format = [$split[2], $split[0], $split[1]];
    
        return implode('-', $format);
    }
}

if (!function_exists('date_format_slash'))
{
    function date_format_slash($date)
    {
        $split  = explode('/', $date);
        $format = [$split[2], $split[0], $split[1]];

        return implode('/', $format);
    }
}