From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: "df -i" support
Date: Thu, 20 May 2004 14:35:11 +0400
Message-ID: <16556.35295.955347.727516@laputa.namesys.com>
References: <20040513093432.52d3d7a3.turtle.power@wanadoo.es>
	<1084439945.14090.6209.camel@tribesman.namesys.com>
	<20040514173227.5b0541b5.turtle.power@wanadoo.es>
	<200405141655.i4EGtrAT007250@turing-police.cc.vt.edu>
	<20040514194040.22389128.turtle.power@wanadoo.es>
	<1084557009.3263.7.camel@localhost.localdomain>
	<20040514202627.18ddc7b2.turtle.power@wanadoo.es>
	<20040514184823.GG18086@schnapps.adilger.int>
	<20040519214145.6082af87.turtle.power@wanadoo.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18782-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040519214145.6082af87.turtle.power@wanadoo.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Miguel <turtle.power@wanadoo.es>
Cc: Andreas Dilger <adilger@clusterfs.com>, Jonathan Briggs <jbriggs@esoft.com>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Miguel writes:

[...]

 > 
 > I see your point doing an strace df -i (with a 2.6.6 kernel)
 > reiserfs_statfs reports those values zeroed:
 > 
 > statfs64("/", 84, {f_type="REISERFS_SUPER_MAGIC", f_bsize=4096,
 > f_blocks=2560271, f_bfree=497245, f_bavail=497245, f_files=0, f_ffree=0,
 > f_fsid={0, 0}, f_namelen=255, f_frsize=4096}) = 0
 > 
 > f_files and f_ffree are 0???. I'm trying to do a patch that show those
 > correctly using show_oidmap() function, but seems that other fs don't
 > report those values correctly, it's going to be deprecated or something?

From statfs(2) man page:
----------------------------------------------------------------------

       Fields that are undefined for a particular file system are
       set to 0.

----------------------------------------------------------------------

Fields like
                 long    f_files;    /* total file nodes in file system */
                 long    f_ffree;    /* free file nodes in fs */

are undefined for file systems that, like reiserfs, have no predefined
number of available inodes.

Nikita.
