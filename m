From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: performance improvements
Date: Mon, 23 Dec 2002 16:59:09 +0100
Message-ID: <20021223165909.R1813@vestdata.no>
References: <200212231632.26686.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12220-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200212231632.26686.russell@coker.com.au>; from russell@coker.com.au on Mon, Dec 23, 2002 at 04:32:26PM +0100
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Russell Coker <russell@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Mon, Dec 23, 2002 at 04:32:26PM +0100, Russell Coker wrote:
> One thing that could really improve system performance would be something=
 like=20
> "nice" but for disk IO.

Yes, that would be very nice :)

Preferably it should use scheduling priority directly, so one doesn't
have to set a seperate value / use a seperate utility.=20


--=20
Ragnar Kj=F8rstad
