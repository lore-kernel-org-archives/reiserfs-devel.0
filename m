From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed
 by kernelnewbies.org regarding reiser4 inclusion)
Date: Sat, 29 Jul 2006 22:57:56 +0400
Message-ID: <17611.44980.749591.920980@gargle.gargle.HOWL>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl>
	<44CA31D2.70203@slaphack.com>
	<Pine.LNX.4.64.0607280859380.4168@g5.osdl.org>
	<44C9FB93.9040201@namesys.com>
	<44CA6905.4050002@slaphack.com>
	<44CA126C.7050403@namesys.com>
	<44CA8771.1040708@slaphack.com>
	<44CABB87.3050509@namesys.com>
	<17611.21640.208153.492074@gargle.gargle.HOWL>
	<44CBA99F.2040306@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29253-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CBA99F.2040306@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, Jeff Garzik <jeff@garzik.org>, Andrew Morton <akpm@osdl.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

David Masover writes:
 > Nikita Danilov wrote:
 > 
 > > As you see, ext2 code already has multiple file "plugins", with
 > > persistent "plugin id" (stored in i_mode field of on-disk struct
 > > ext2_inode).
 > 
 > Aha!  So here's another question:  Is it fair to ask Reiser4 to make its
 > plugins generic, or should we be asking ext2/3 first?

ext2/3 plugins are generic: in Linux every file system can implement
per-object behavior by specifying
{file,inode,dentry,address_space}_operations. This mechanism is provided
by VFS (and, in fact, is the only way that VFS interacts with file
system) and is completely generic.

 > 

Nikita.

