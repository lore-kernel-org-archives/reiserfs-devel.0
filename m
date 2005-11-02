From: michael chang <thenewme91@gmail.com>
Subject: Re: reiser3.6 files inaccessable from rescue CD post reiserfsck --rebuild-tree
Date: Tue, 1 Nov 2005 19:03:13 -0500
Message-ID: <b14e81f00511011603i69720c80q4f2c290bb4c90420@mail.gmail.com>
References: <b14e81f00510301555j24f63c43x6a1bbda08bd4e5d1@mail.gmail.com>
	 <4365D722.8010409@namesys.com>
	 <b14e81f00510311341q522dae68i9dc06fea1e71dc4@mail.gmail.com>
	 <43675BBA.1050202@namesys.com> <43675F84.3040902@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26762-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43675F84.3040902@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On 11/1/05, Vladimir V. Saveliev <vs@namesys.com> wrote:
> Hello
>
> Vladimir V. Saveliev wrote:
> >>
> >>Unfortuantely, I didn't think to thorughly read your e-mail (misread
> >>the first line) before preceeding to run reiserfsck from a different,
> >>newer live CD (that I had a friend burn), which ran just fine.  While
> >>some files have "dissapeared" into lost+found (which means they need
> >>to be recatagorized or something, including everything in /boot), the
> >>remainder of the files (maybe 94% of them or so) are now readable.  I
> >>have no idea whether or not this is considered "progress".  Probably
> >>now have to go sort them by magic or something, with filenames like
> >>"25740_124378" on them.
> >
> > It might also be useful for you if knew that this file was initially cr=
eated in
>
> I meant:
> It might be useful if you knew that this file was initially created in a
> directory whose id is 25740. You can try to find that directory with find=
 /mnt
> -inum 25740
>

I understood the original message, and the clarification was very
helpful.  Thank you very much.

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
