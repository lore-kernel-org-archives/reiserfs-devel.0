From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: data-logging time comparison
Date: Fri, 02 Aug 2002 01:24:28 +0200
Message-ID: <3D49C32C.8010404@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11109-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hi!

Maybe you are interested in my recent backup time comparison. I simply 
copied the partitions with "cp -ax /.../a/. /.../b/" where "/.../b/" is 
a freshly created reiserfs. I hope the comparison is readable and makes 
sense for someone.

I'm not really glad with the first values of the "living" root 
filesystem, partition 1. Did I forget something (except for taking 
data=journal values, sorry) ?


Best regards,

Manuel


Timings:
--------
partition 1: /dev/hdd7  2722896  1929600   793296  71% /mnt/alpha
  (is my / filesystem)

used FS mounted noatime,notail
  real  6m53.929s  user  0m1.250s  sys  0m50.310s  ~4,552MB/s    48%
used FS mounted noatime,notail,data=ordered
  real 12m3.885s   user  0m1.520s  sys  0m49.900s  ~2,603MB/s    27%
new FS mounted noatime,notail
  real  3m18.826s  user  0m1.310s  sys  0m49.710s  ~9,478MB/s  =100%
new FS mounted noatime,notail,data=ordered
  real  4m6.866s   user  0m1.620s  sys  0m50.120s  ~7,633MB/s    81%


partition 2: /dev/hdd11 5550248  4738084   812164  86% /mnt/beta
  (is my software "repository")

used FS mounted noatime,notail
  real  9m21.212s  user  0m1.480s  sys  1m42.160s  ~8,245MB/s    99,9%
used FS mounted noatime,notail,data=ordered
  real 12m38.088s  user  0m1.780s  sys  1m38.100s  ~6,104MB/s    74%
new FS mounted noatime,notail
  real  9m20.956s   user  0m1.680s  sys  1m39.190s  ~8,248MB/s  =100%
new FS mounted noatime,notail,data=ordered
  real  11m54.513s user  0m1.910s  sys  1m38.460s  ~6,476MB/s    79%



Setup:
------
2.4.19-rc3
+ reiserfs-pending: 01.change_help_wording.diff
                     02.change_menu_wording.diff
                     03.confusing_journal_replay_warning_removal.diff
                     05.hash_on_empty_fs-1.diff
+ mason: 01-relocation-4.diff
          02-commit_super-8-relocation.diff
          03-data-logging-23.diff
          04-write_times.diff
          05-search_reada-4.diff
+ rml: preempt-kernel-rml-2.4.19-rc2-1.patch



