From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: [PAID PRIORITY SUPPORT REQUEST] Quotas not fully working in
 2.4.21-pre5
Date: Sat, 5 Apr 2003 02:45:29 +0200
Message-ID: <20030405024529.71d46842.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13582-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-list@namesys.com>, reiserfs-dev@namesys.com


Object: Can't set quotas with 2.4.21-pre5

 Hi,

 After we upgraded from 2.4.19-pre6 + quota patches , 2.4.21-pre5 + data-logging and quota
patches, we can't set quotas anymore.

Well, everything seems to work ( partition is mounted with grpquota ) , quotaon is enabled on that
partition and the symptom is that quotactl fails :

smembp01:~# mount | egrep sdb1
/dev/sdb1 on /data/members type reiserfs (rw,noatime,nodiratime,notail,grpquota)

smembp01:~# quotaon -p /dev/sdb1
group quota on /data/members (/dev/sdb1) is on
user quota on /data/members (/dev/sdb1) is off


here is an extract from 2 straces:

quotactl(Q_SETQLIM|GRPQUOTA, "/dev/sdb1", 502242, {2048, 0, 0, 0, 0, 0, 0, 0}) = -1 EINVAL (Invalid argument)

quotactl(Q_SETQLIM|GRPQUOTA, "/dev/sdb1", 32066, {2048, 0, 0, 0, 0, 0, 0, 0}) = -1 EINVAL (Invalid argument)

This problem is really nasty as this filer is used for the paying services and now clients can use as much
space as they want.

Thanks,

philippe.

smembp01:~# repquota -gv -F vfsv0 /dev/sdb1 | wc -l
  63619


smembp01:~# repquota -gv -F vfsv0 /dev/sdb1 | more
*** Report for group quotas on device /dev/sdb1
Block grace time: 7days; Inode grace time: 7days
                        Block limits                File limits
Group           used    soft    hard  grace    used  soft  hard  grace
----------------------------------------------------------------------
root      --   24435       0       0         126334     0     0       
#32768    --      13       0       0              5     0     0       
#33261    --       9       0       0              4     0     0       
#33754    --      13       0       0              5     0     0       
#34247    --       9       0       0              4     0     0       
#1972     --    4473       0       0            364     0     0       
#100276   --       9       0       0              4     0     0       
#34740    --  107909       0       0           2639     0     0       
#35233    --    5455       0       0            322     0     0       
#200059   --   22141       0       0             87     0     0       
#200552   --      13       0       0              5     0     0       
#201045   --       9       0       0              4     0     0       
#201538   --      13       0       0              5     0     0       
#70466    --      13       0       0              5     0     0       
#400118   --      13       0       0              5     0     0       
#40163    --      13       0       0              5     0     0       
#400611   --       9       0       0              4     0     0       
#40656    --       9       0       0              4     0     0       
#401104   --      13       0       0              5     0     0       
#41149    --      13       0       0              5     0     0       
#401597   --      13       0       0              5     0     0       
#32425    --       9       0       0              4     0     0       
#32918    --       9       0       0              4     0     0       
#150      -- 12297295       0       0        1764086     0     0       
#33411    --       9       0       0              4     0     0       
#33904    --      13       0       0              5     0     0       
#1629     --      13       0       0              5     0     0       
#34397    --       9       0       0              4     0     0       
#34890    --      95       0       0             22     0     0       
#35383    --       9       0       0              4     0     0       
#200702   --       9       0       0              4     0     0       
#70123    --      13       0       0              5     0     0       
#201195   --       9       0       0              4     0     0       
#70616    --       9       0       0              4     0     0       
#201688   --       9       0       0              4     0     0       
#400268   --       9       0       0              4     0     0       
#40313    --      13       0       0              5     0     0       
#400761   --      13       0       0              5     0     0       
#40806    --      13       0       0              5     0     0       
#401254   --       9       0       0              4     0     0       
#500051   --      13       0       0              5     0     0       
#401747   --      13       0       0              5     0     0       
#907944   --    5986       0       0            107     0     0       
#23208    --      13       0       0              5     0     0       
#23701    --   16662       0       0             53     0     0       
#908437   --      34       0       0             15     0     0       
....
....
etc..
