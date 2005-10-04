From: Chris Bainbridge <chris.bainbridge@gmail.com>
Subject: Re: Problems compiling 2.6.13.2 + reiser4 patch
Date: Tue, 4 Oct 2005 15:52:19 +0000
Message-ID: <623652d50510040852v4ad9f39dj@mail.gmail.com>
References: <434004D9.4030501@free.fr> <4341741D.90700@free.fr>
	 <434178F6.7090500@namesys.com> <4341830B.8050504@free.fr>
	 <43421706.4050904@namesys.com> <43422333.6030304@free.fr>
	 <43429C34.6000404@namesys.com>
Reply-To: Chris Bainbridge <chris.bainbridge@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26395-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43429C34.6000404@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 04/10/05, Vladimir V. Saveliev <vs@namesys.com> wrote:
> Hello
>
> It looks like we have fixed one more reiser4 problem in 2.6.13. I can not=
 say
> for sure that it fixes "scheduling while atomic" problem because I could =
not yet
> reproduce it. Please try it.
>
>
> The full set of patches is
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.13/reiser4-for-2.6.13-2.bro=
ken-out.tar.gz.

It looks like you caught it - preempt kernel is no longer giving me
"scheduling while atomic" errors. Thanks.
