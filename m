From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: data-logging time comparison
Date: Fri, 02 Aug 2002 20:32:21 +0200
Message-ID: <3D4AD035.7080902@mb.tu-ilmenau.de>
References: <3D49C32C.8010404@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11114-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 08/02/2002 01:24 AM, Manuel Krause wrote:
> Hi!
> 
> Maybe you are interested in my recent backup time comparison. I simply 
> copied the partitions with "cp -ax /.../a/. /.../b/" where "/.../b/" is 
> a freshly created reiserfs. I hope the comparison is readable and makes 
> sense for someone.
> 

O.k.

I made a new comparison with just the data-logging patch replaced by the 
new -24, and now, only using fresh filesystems. I added the related 
lines from tonight to show the improvement.

File size distribution statistics are available via email upon request 
(131kB as .tar.gz).

Best wishes,

Manuel


partition 1: /dev/hdd7   2722896   1925876    797020  71% /mnt/alpha
  (is my / filesystem)

new FS noatime,notail,data=writeback
  real  3m11.881s  user  0m1.600s  sys  0m49.040s   ~9,802MB/s  =100%
new FS noatime,notail,data=ordered
  real  3m19.895s  user  0m1.400s  sys  0m49.890s   ~9,409MB/s    96%
new FS noatime,notail,data=journal
  real  6m48.534s  user  0m1.570s  sys  1m0.830s    ~4,604MB/s    47%
new FS noatime,notail "data-logging-23"
  (real  3m18.826s user  0m1.310s  sys  0m49.710s)  ~9,478MB/s    97%
new FS noatime,notail,data=ordered "data-logging-23"
  (real  4m6.866s  user  0m1.620s  sys  0m50.120s)  ~7,633MB/s    78%



partition 2: /dev/hdd11  5550248   4490128   1060120  81% /mnt/alpha
  (is my software "repository")

new FS noatime,notail,data=writeback
  real  8m46.739s  user  0m1.430s sys   1m32.110s   ~8,325MB/s  =100%
new FS noatime,notail,data=ordered
  real  8m56.040s  user  0m1.410s  sys  1m27.920s   ~8,180MB/s    98%
new FS noatime,notail,data=journal
  real 18m36.456s  user  0m1.750s  sys  1m58.480s   ~3,928MB/s    47%
new FS noatime,notail partition 86% full, "data-logging-23"
  (real  9m20.956s user  0m1.680s  sys  1m39.190s)  ~8,248MB/s    99%
new FS noatime,notail,data=ordered part. 86% full, "data-logging-23"
  (real 11m54.513s user  0m1.910s  sys  1m38.460s)  ~6,476MB/s    78%

