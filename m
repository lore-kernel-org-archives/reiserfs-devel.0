From: Toby Dickenson <tdickenson@devmail.geminidataloggers.co.uk>
Subject: Re: back up to disk
Date: Wed, 16 Oct 2002 07:19:21 +0100
Message-ID: <200210160719.21964.tdickenson@devmail.geminidataloggers.co.uk>
References: <20021015224213.4BBAA1AEC13E@server5.fastmail.fm>
Reply-To: tdickenson@geminidataloggers.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11712-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021015224213.4BBAA1AEC13E@server5.fastmail.fm>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: JP Howard <jh_lists@fastmail.fm>, Russell Coker <bofh@coker.com.au>, ReiserFS List <reiserfs-list@namesys.com>

On Tuesday 15 Oct 2002 11:42 pm, JP Howard wrote:

> We've been thinking about something like that, using this extremely nif=
ty
> trick:
>
> http://www.mikerubel.org/computers/rsync_snapshots/

One limitation with any scheme based on rsync is that it uses memory=20
proportional to the number of files. This may or may not be a problem for=
=20
you.


