From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13536] crash while copying atime with touch
Date: Tue, 18 Aug 2009 09:21:01 GMT
Message-ID: <200908180921.n7I9L1xm010896@demeter.kernel.org>
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





--- Comment #18 from Christian Kujau <lists@nerdbynature.de>  2009-08-18 09:21:00 ---
On 8/18/09 2:07 AM, bugzilla-daemon@bugzilla.kernel.org wrote:
>> This should be the raw value of the SMART temperature attribute, not the
>> real value.
>
> how can we determine the real value then ?

My wording was wrong: the 123 degrees were not the "raw" but the 
"normalized" value:

http://smartmontools.sourceforge.net/faq.html#disk-temperature

> on my system it looks like this:
[...]

Yeah, on mine too. smartd however has to be tought to print the raw 
("real") value as well, as the FAQ above explains.

C.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
