From: Nicolae Mihalache <mache@abcpages.com>
Subject: corrupted files
Date: Sat, 09 Apr 2005 00:25:46 +0200
Message-ID: <425704EA.7020707@abcpages.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23814-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I have experience some weird problems on a reiserfs partition. I tried 
to copy a big archive (6.9GB) from another computer using scp or ftp and 
it seems that the file gets somehow corrupted. Right now I manage to 
reproduce the problem even locally, I copy the file in the same 
directory, no error, still cmp tells they are different:

 >>>
cdmcs-s:/storage/cdmcsv2 # cp cdmcs-a.tgz cdmcs-a.tgz.corrupted2
cdmcs-s:/storage/cdmcsv2 # cmp cdmcs-a.tgz cdmcs-a.tgz.corrupted2
cdmcs-a.tgz cdmcs-a.tgz.corrupted2 differ: char 216256513, line 789057
cdmcs-s:/storage/cdmcsv2 # ls -l cdmcs-a.tgz cdmcs-a.tgz.corrupted2
-rw-r--r--    1 root     root     7321937920 Apr  8 18:44 cdmcs-a.tgz
-rw-r--r--    1 root     root     7321937920 Apr  8 23:46 
cdmcs-a.tgz.corrupted2
 >>>>

It may be a hardware problem but I somehow doubt it.
reiserfsck says No corruptions found.
The system is SuSE 9.0, kernel 2.4.21-273-smp4G (it is a dell poweredge 
with two pentium III cpus).

Any idea?

nicolae

