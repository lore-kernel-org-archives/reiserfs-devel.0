From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Tue, 18 Aug 2009 09:07:38 GMT
Message-ID: <200908180907.n7I97cmR009052@demeter.kernel.org>
References: <bug-13536-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13536-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13536





--- Comment #17 from Roland Kletzing <devzero@web.de>  2009-08-18 09:07:37 ---
>This should be the raw value of the SMART temperature attribute, not the 
>real value.

how can we determine the real value then ?

on my system it looks like this:

neoware:~ # smartctl -d ata -a /dev/sda |egrep "RAW_VALUE|Temperature_Celsius"
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED 
WHEN_FAILED RAW_VALUE
194 Temperature_Celsius     0x0022   076   046   000    Old_age   Always      
-       52 (Lifetime Min/Max 9/67)

mind the column "RAW_VALUE". 
so, if smartd isn`t telling nonsense, my disk runs a little bit cooler....
(whereas i think 52 degrees is still too hot)


>I will read Roland Kletzings howto on creating kernel core dumps to 
>provide useful information, soon.
mind, that this is just a pointer. i cannot even tell how good this works or if
it works at all, as i did not try it.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
