From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Mon, 31 Jul 2006 15:58:30 +0400
Message-ID: <17613.61542.441990.620222@gargle.gargle.HOWL>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl>
	<44CA31D2.70203@slaphack.com>
	<Pine.LNX.4.64.0607280859380.4168@g5.osdl.org>
	<44C9FB93.9040201@namesys.com>
	<44CA6905.4050002@slaphack.com>
	<44CA126C.7050403@namesys.com>
	<44CA8771.1040708@slaphack.com>
	<44CABB87.3050509@namesys.com>
	<17611.21640.208153.492074@gargle.gargle.HOWL>
	<44CBE7FF.2030109@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750905AbWGaMD3@vger.kernel.org>
In-Reply-To: <44CBE7FF.2030109@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Linus Torvalds <torvalds@osdl.org>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, Jeff Garzik <jeff@garzik.org>, Andrew Morton <akpm@osdl.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser writes:
 > Nikita Danilov wrote:

[...]

 > >
 > >As you see, ext2 code already has multiple file "plugins", with
 > >persistent "plugin id" (stored in i_mode field of on-disk struct
 > >ext2_inode).
 > >
 > >Nikita.
 > >
 > >
 > So the job is already done.  Good.  Reiser4 can be included then.:) 

Indeed, namesys already implemented requirements pointed to by Christoph
Hellwig, as far as meta-data plugins are concerned, so this issue is not
an obstacle.

 > 
 > Hans "The Easily Agreeable" Reiser
 > 

PS: please, don't trim CC lists.

Nikita.
