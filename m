From: "Sarath Menon" <sarathmenon@gmail.com>
Subject: Re: fsck.reiser4 segfaults
Date: Sat, 1 Apr 2006 08:13:01 +0000
Message-ID: <932539950604010013w44d30453r898a0a1ed3ee3b8d@mail.gmail.com>
References: <932539950603310621m67305c9eg42492492b84767fc@mail.gmail.com>
	 <1143822776.6320.84.camel@tribesman.namesys.com>
	 <932539950603311021x201d9e13mfdf9e95923e1f744@mail.gmail.com>
	 <442D8F45.7090403@dermichi.com> <442E178D.40300@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <442E178D.40300@gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jfeise@gmail.com
Cc: Michael Weissenbacher <webmaster@dermichi.com>, reiserfs-list@namesys.com

Me too, ;) I also found http://www.lxnaydesign.net/, useful if you
need a browser to be around too.

Here's the dmesg output when i try to mount it.

reiser4[mount(11756)]: renew_sibling_link
(fs/reiser4/tree_walk.c:441)[nikita-3532]:
WARNING: Sibling nodes on the different levels: 4 !=3D 4

reiser4[mount(11756)]: key_warning (fs/reiser4/plugin/object.c:97)[nikita-7=
17]:
WARNING: Error for inode 42 (-5)

The kernel version seems to be a bit old at 2.6.10-lxnay3. Should I
try with a newer kernel, with debug args maybe?

Thanks,
Sarath

On 4/1/06, Joachim Feise <jfeise@gmail.com> wrote:
> Michael Weissenbacher wrote on 03/31/06 12:21:
>
> > Hi,
> >> reiserfsprogs and libaal are both 1.0.5. I'll give you the dmesg
> >> output tommorow - I need to get a livecd with reiser4 patches - its
> >> more difficult than I initially thought ;)
> > I'm using RIPLinux, which has reiser4 support.
> > http://www.tux.org/pub/people/kent-robotti/looplinux/rip/
>
>
> Thanks for that info. I was looking for a boot disk with reiser4 for some=
 time.
>
> -Joe
>


--
--------------------------
I presume, when you pronounce iptables, you say that you are peeing tables
