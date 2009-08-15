From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Sat, 15 Aug 2009 16:19:28 GMT
Message-ID: <200908151619.n7FGJSse029130@demeter.kernel.org>
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





--- Comment #13 from Roland Kletzing <devzero@web.de>  2009-08-15 16:19:26 ---
i don`t know how to do a kernel dump core, but besides all that, i think you
have another major problem with your system. 

i`d probably call that a root-cause (found it in the logs you sent):

Jun 14 10:50:07 scaleo smartd[3947]: Device: /dev/sda [SAT], SMART Usage
Attribute: 194 Temperature_Celsius changed from 111 to 123
Jun 14 10:50:07 scaleo smartd[3947]: Device: /dev/sdb [SAT], SMART Prefailure
Attribute: 7 Seek_Error_Rate changed from 200 to 100
Jun 14 10:50:07 scaleo smartd[3947]: Device: /dev/sdb [SAT], SMART Usage
Attribute: 194 Temperature_Celsius changed from 112 to 123
Jun 14 11:20:07 scaleo smartd[4022]: Device: /dev/sda [SAT], SMART Usage
Attribute: 194 Temperature_Celsius changed from 123 to 112


123 degrees celsius ?  

DOH! 

i never saw a harddisk getting that hot and by sure that`s an operational
temperature which is above the specs.

i think you could fry eggs on your harddisks!!!

if the harddisks really get that hot (please check that smartd doesn`t lie
here) i`d first consider getting the cooling for your system fixed.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
