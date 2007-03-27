From: "Lin Shen \(lshen\)" <lshen@cisco.com>
Subject: RE: Why reiser does a disk write on every sync() call?
Date: Tue, 27 Mar 2007 10:20:48 -0700
Message-ID: <08A9A3213527A6428774900A80DBD8D803BB80B4@xmb-sjc-222.amer.cisco.com>
References: <200703271159.49505.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-30619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
In-Reply-To: <200703271159.49505.vs@namesys.com>
DKIM-Signature: v=0.5; a=rsa-sha256; q=dns/txt; l=1371; t=1175016053; x=1175880053;
	c=relaxed/simple; s=sjdkim2002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=lshen@cisco.com;
	z=From:=20=22Lin=20Shen=20\(lshen\)=22=20<lshen@cisco.com>
	|Subject:=20RE=3A=20Why=20reiser=20does=20a=20disk=20write=20on=20every=2
	0sync()=20call?
	|Sender:=20;
	bh=7Z/tTV1wdXjhgPF9Khuzj4ilTaJ5XxqWrt/XIwGLi6E=;
	b=WThER+KtiQ/0/RjrTcyaZCQgio0IPuqVxIScQyeijDZyhM3oiSu2RFqG7mStGdyVn0AwQR+u
	/BjKIE6cggA2e5Jq7i1KB79eWlWcywxj/jtB3GVGK1dyCjJmjUFkQuc4;
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

I saw 32 blocks by calling sync() alone.

Lin

> -----Original Message-----
> From: Vladimir V. Saveliev [mailto:vs@namesys.com]=20
> Sent: Tuesday, March 27, 2007 1:00 AM
> To: Lin Shen (lshen)
> Cc: reiserfs-list@namesys.com
> Subject: Re: Why reiser does a disk write on every sync() call?
>=20
> Hello
>=20
> On Monday 26 March 2007 22:12, Lin Shen (lshen) wrote:
> > I'm using iostat to measure disk reads/writes associated=20
> with various=20
> > file operations under Reiser. One thing I noticed and can't=20
> explain is=20
> > that every sync() call by itself (not following a write or=20
> anything)=20
> > will cause an I/O write. Any ideas?
> >=20
>=20
> The I/O write is performed by reiserfs implementation of=20
> sync_fs method of struct super_operations.
> If filesystem is mounted r/w - reiserfs_sync_fs begins a=20
> transaction (or joins an existing one), journal super block=20
> if the transaction has zero length, closes the transaction=20
> and flushes old transactions including the one which was just=20
> closed. So, if there were no transaction to flush before=20
> sync() - one transaction of length 1 gets created, closed,=20
> committed and flushed. 5 blocks get written to disk in this=20
> case. My calculation can be wrong, though.
> How much I/O do you notice?=20
>=20
> > Lin
> >=20
> >=20
>=20
