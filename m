From: Naoki <naoki@valuecommerce.ne.jp>
Subject: Re: Getting very interesting - Poor read performance
Date: Fri, 08 Nov 2002 09:23:02 +0900
Message-ID: <3DCB03E6.7040602@valuecommerce.ne.jp>
References: <200211071809.gA7I90nd004446@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11946-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/html; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
</head>
<body>
Aha, very good point.<br>
<br>
Now strace'ing the 'wc' I see the same on both servers. Just a bunch of 'read'<br>
sys calls.<br>
<br>
So why would 'read' generate such a different user time on the two machines?<br>
<br>
Trying some tests with larger files in where the problem becomes far more
evident:<br>
<br>
<b>'New' box</b> :<br>
<br>
# wc -l bigfile<br>
<br>
&nbsp;290314 bigfile<br>
<br>
real&nbsp;&nbsp;&nbsp; 0m23.047s<br>
user&nbsp;&nbsp;&nbsp; 0m16.072s<br>
sys&nbsp;&nbsp;&nbsp;&nbsp; 0m0.348s<br>
<br>
#&nbsp;mount<br>
 /dev/sda3 on / type reiserfs (rw,noatime,nodiratime,nolog)<br>
<br>
# strace -c wc bigfile<br>
execve("/usr/bin/wc", ["wc", "bigfile"], [/* 23 vars */]) = 0<br>
290314 3127604 40121984 bigfile<br>
% time&nbsp;&nbsp;&nbsp;&nbsp; seconds&nbsp; usecs/call&nbsp;&nbsp;&nbsp;&nbsp; calls&nbsp;&nbsp;&nbsp; errors syscall<br>
------ ----------- ----------- --------- --------- ----------------<br>
&nbsp;68.33&nbsp;&nbsp;&nbsp; 0.104694&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 43&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2453&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read<br>
&nbsp;31.51&nbsp;&nbsp;&nbsp; 0.048270&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 76&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 637&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write<br>
&nbsp; 0.07&nbsp;&nbsp;&nbsp; 0.000113&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7 open<br>
&nbsp; 0.02&nbsp;&nbsp;&nbsp; 0.000029&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; munmap<br>
&nbsp; 0.02&nbsp;&nbsp;&nbsp; 0.000028&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmap2<br>
&nbsp; 0.02&nbsp;&nbsp;&nbsp; 0.000025&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_mmap<br>
&nbsp; 0.01&nbsp;&nbsp;&nbsp; 0.000020&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fstat64<br>
&nbsp; 0.01&nbsp;&nbsp;&nbsp; 0.000013&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close<br>
&nbsp; 0.01&nbsp;&nbsp;&nbsp; 0.000010&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; brk<br>
&nbsp; 0.00&nbsp;&nbsp;&nbsp; 0.000005&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mprotect<br>
&nbsp; 0.00&nbsp;&nbsp;&nbsp; 0.000004&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uname<br>
------ ----------- ----------- --------- --------- ----------------<br>
100.00&nbsp;&nbsp;&nbsp; 0.153211&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3133&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7 total<br>
<br>
<br>
<br>
<b>Old box</b> :<br>
<br>
# time wc -l /root/bigfile<br>
&nbsp;290314 /root/bigfile<br>
0.68user 0.09system 0:00.86elapsed 88%CPU (0avgtext+0avgdata 0maxresident)k<br>
0inputs+0outputs (114major+19minor)pagefaults 0swaps<br>
<br>
And again :<br>
<br>
[root@banner23 logs]# strace -c wc /root/bigfile<br>
execve("/usr/bin/wc", ["wc", "/root/bigfile"], [/* 20 vars */]) = 0<br>
&nbsp;290314 3127604 40121984 /root/bigfile<br>
% time&nbsp;&nbsp;&nbsp;&nbsp; seconds&nbsp; usecs/call&nbsp;&nbsp;&nbsp;&nbsp; calls&nbsp;&nbsp;&nbsp; errors syscall<br>
------ ----------- ----------- --------- --------- ----------------<br>
&nbsp;99.59&nbsp;&nbsp;&nbsp; 0.100965&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 41&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2453&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read<br>
&nbsp; 0.16&nbsp;&nbsp;&nbsp; 0.000161&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 open<br>
&nbsp; 0.07&nbsp;&nbsp;&nbsp; 0.000075&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; brk<br>
&nbsp; 0.06&nbsp;&nbsp;&nbsp; 0.000062&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_mmap<br>
&nbsp; 0.03&nbsp;&nbsp;&nbsp; 0.000031&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close<br>
&nbsp; 0.02&nbsp;&nbsp;&nbsp; 0.000023&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fstat<br>
&nbsp; 0.02&nbsp;&nbsp;&nbsp; 0.000019&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; munmap<br>
&nbsp; 0.01&nbsp;&nbsp;&nbsp; 0.000015&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write<br>
&nbsp; 0.01&nbsp;&nbsp;&nbsp; 0.000015&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mprotect<br>
&nbsp; 0.01&nbsp;&nbsp;&nbsp; 0.000008&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fstat64<br>
&nbsp; 0.00&nbsp;&nbsp;&nbsp; 0.000005&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ioctl<br>
&nbsp; 0.00&nbsp;&nbsp;&nbsp; 0.000002&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; getpid<br>
&nbsp; 0.00&nbsp;&nbsp;&nbsp; 0.000002&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; personality<br>
------ ----------- ----------- --------- --------- ----------------<br>
100.00&nbsp;&nbsp;&nbsp; 0.101383&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2516&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 total<br>
<br>
<br>
# mount<br>
/dev/sda3 on / type reiserfs (rw,noatime,nodiratime)<br>
<br>
<br>
That's messed up! Why are they doing exactly the same # of 'read' calls<br>
but my newer system has decided to add 637 'write' calls ??????<br>
<br>
What reiserfs / mount options should I try to get this at a more normal level
?<br>
<br>
<br>
-n.<br>
<br>
<a class="moz-txt-link-abbreviated" href="mailto:Valdis.Kletnieks@vt.edu">Valdis.Kletnieks@vt.edu</a> wrote:<br>
<blockquote type="cite"
 cite="mid200211071809.gA7I90nd004446@turing-police.cc.vt.edu">
  <pre wrap="">On Thu, 07 Nov 2002 19:59:55 +0900, Naoki <a class="moz-txt-link-rfc2396E" href="mailto:naoki@valuecommerce.ne.jp">&lt;naoki@valuecommerce.ne.jp&gt;</a>
said:

  </pre>
  <blockquote type="cite">
    <pre wrap="">real    0m3.059s
user    0m2.543s &lt;== say what???
sys     0m0.064s
    </pre>
  </blockquote>
  <blockquote type="cite">
    <pre wrap="">0.25user 0.04system 0:00.38elapsed 76%CPU (0avgtext+0avgdata
    </pre>
  </blockquote>
  <pre wrap=""><!---->0maxresident)k
  </pre>
  <blockquote type="cite">
    <pre wrap="">0inputs+0outputs (115major+19minor)pagefaults 0swaps
    </pre>
  </blockquote>
  <pre wrap=""><!---->
I'd start by investigating why on the new box the 'user' time is 2.5+
seconds.

Notice that the 'system' times on both boxes are comparable (0.06 versus
0.04 - low enough that timer resolution probably matters in any jitter
in
the measurements).

Does 'which wc' show you running something other than /usr/bin/time on
the
new box?
  </pre>
</blockquote>
<br>
</body>
</html>

