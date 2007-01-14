From: "Matheus Izvekov" <mizvekov@gmail.com>
Subject: Re: bad reiser4 fs causes system to freeze
Date: Sun, 14 Jan 2007 18:42:30 -0200
Message-ID: <305c16960701141242t6ec9c478oaf1f0147f0074c78@mail.gmail.com>
References: <305c16960701130129n3122c73co89d85504267a724a@mail.gmail.com>
	 <45AA5A3A.50002@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30390-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45AA5A3A.50002@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com

On 1/14/07, Edward Shishkin <edward@namesys.com> wrote:
> Matheus Izvekov wrote:
>
> > Hi all
> > This filesystem got corrupted by a crash in the middle of an rsync,
>
>
> what did the first crash look like? also freezing?
>

I cant tell, because i was in X, and even the mouse pointer froze.
Also, nothing got saved in my log file, which was in another fs.

> > and after that whenever i try to rsync again, my system completely
> > freezes and i cant even get the oops msg.
>
>
> serial console would help here..
>

Its a bit painful to setup a serial console here. please take a look
at the dump and try to reproduce it (it was 100% reproducible in 6
times i tried). if you cant, ill try to get that oops message.

> > Im using 2.6.19 with latest patch from namesys.
> > i have a metadata dump of this, its a 8mb bzip2 file. I can send it on
> > request.
> >
>
> ok, let's take a look..

Its sent in private

> Thanks.
>

Thanks
