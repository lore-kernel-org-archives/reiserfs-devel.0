From: Fabien Salvi <fabien@cri74.org>
Subject: Quota and reiserfs status
Date: Fri, 07 Jun 2002 15:43:28 +0200
Sender: fabien@cri74.org
Message-ID: <3D00B880.E3A7B770@cri74.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------40F553176603FC5E0C0F8129"
Return-path: <reiserfs-list-return-10669-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

--------------40F553176603FC5E0C0F8129
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

I've tried some tests with quota using reiserfs filesystems.
It works very well...

I have attached a very little documentation (2 ascii texts) about simple
configuration.
Hope it can help somebody.

I have one question :
Now, you must patch linux kernel to have quota with reiserfs enabled.

Is it provided to the near future, or maybe not before the next stable
release of lk ?

I've made some benchs and I have no problems.
But, can we considere quota support stable enough for production use ?

Thanks in advance for your help.

B.R.

-------------
Fabien SALVI      Centre de Ressources Informatiques
                  Archamps, France -- http://www.cri74.org
                  PingOO GNU/linux distribution : http://www.pingoo.org
--------------40F553176603FC5E0C0F8129
Content-Type: text/plain; charset=us-ascii;
 name="howto_quota_with_reiserfs.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="howto_quota_with_reiserfs.txt"

 QUOTA under linux with REISERFS Filesystem
 Fabien SALVI <fabien@cri74.org>
 7 June 2002


To have quota with reiserfs, you have to patch linux kernel

For example, with 2.4.18 kernel :


==> If you use the standard kernel, you won't be able to use quota with reiserfs !!


1) Get kernel source, for example file linux-2.4.18.tar.gz

2) Get patches from ftp://ftp.suse.com/pub/people/mason/patches/reiserfs/quota-2.4/2.4.18/

2) Untar the linux kernel source and gunzip the patches

3) Follow the README given with the patches and apply patches to the linux kernel
example :
cd path/to/linux
patch -p1 < path/to/patch-file

4) Configure your kernel with quota support

5) Recompile your kernel and boot on it

It *should* work :)

6) Get the last quota-tools on http://sourceforge.net/projects/linuxquota/
and compile/install it


--------------40F553176603FC5E0C0F8129
Content-Type: text/plain; charset=us-ascii;
 name="howto_using_quotas.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="howto_using_quotas.txt"

 QUOTA FOR LINUX FILESYSTEMS (tested with ext2 and reiserfs)
 Fabien SALVI <fabien@cri74.org>
 7 June 2002


Warning !
To have quota with reiserfs, you need to apply patches to the standard kernel, see howto_quota_with_reiserfs.txt


1) You must mount partitions with the right option, example in fstab:
/dev/sdb1 /var/www reiserfs rw,usrquota                 0       0
/dev/sdb2 /test ext2 defaults,usrquota                  0       2

2) If the partitions are already mounted without the quota option, you must umount and remount them (or reboot if it is not possible, ie devices busy...)


3) Run quotacheck command, example :

$ quotacheck -c  -avug
quotacheck: Scanning /dev/sdb1 [/var/www] done
quotacheck: Checked 3080 directories and 42649 files
quotacheck: Old file not found.
quotacheck: Scanning /dev/sdb2 [/test] done
quotacheck: Checked 3 directories and 1 files
quotacheck: Old file not found.

This will create quota files named "aquota.user" in /var/www and /test (the 2 partitions with quota option)

4) Activate quota with quotaon -a

5) use edquota to put quota on a user
For example :
$ equota fabien
And adjust values to your needs

6) Verify an user quota :
$ quota -v fabien
Disk quotas for user fabien (uid 1001): 
     Filesystem  blocks   quota   limit   grace   files   quota   limit   grace
      /dev/sdb1       1   10000   20000               1       0       0        
      /dev/sdb2       8    5000   10000               2       0       0        

7) If you want an user to see its quota, change permissions of files aquota.user to 0644

--------------40F553176603FC5E0C0F8129--

