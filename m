From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Lost ACL
Date: Fri, 13 Feb 2004 21:48:27 +0300
Message-ID: <16429.7163.319615.173151@laputa.namesys.com>
References: <402CE469.4010809@gbf.de>
	<402D1B26.3040009@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16788-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <402D1B26.3040009@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Joachim Reichelt <Reichelt@gbf.de>, reiserfs-list@namesys.com

Jeff Mahoney writes:
 > -----BEGIN PGP SIGNED MESSAGE-----
 > Hash: SHA1
 > 
 > Joachim Reichelt wrote:
 > | Dear all,
 > |
 > | on SuSE 8.1 we have a fileserver with acl's on 500GB on a hardware raid.
 > | Now we had to powerdown the system. The controler seems to have not
 > | properly written all data to disk. So i had to do a
 > | reiserfsck --fix-fixable /dev/sda8
 > |
 > | This did nearly the whole job, but left me with a tree
 > | ./.reiserfs_privat/xattr/ (size of dir is ~38MB)
 > | The files thereis seems to be two hex numbers seperated by a dot e.g.
 > | 12E63C.24C58
 > | and no acl.
 > | What can I do to get acl back?
 > |
 > 
 > The .reiserfs_priv/xattr hierarchy is how my xattr/acl code stores the
 > ACLs without a disk format change. The hex numbers are
 > <objectid>.<generation number>, and then the individual xattrs are
 > stored inside that directory with their name as the filenames.
 > 
 > This directory is hidden (and used to find ACLs) when ACLs or xattrs are
 > enabled. Is your filesystem mounted with -oacl?

As Vladimir suggested, it may be fsck that "restored" .reiserfs_priv and
made it visible.

 > 
 > - -Jeff
 > 

Nikita.

 > - --
 > Jeff Mahoney
 > SuSE Labs
 > jeffm@suse.com
