From: "Gregory Maxwell" <gmaxwell@gmail.com>
Subject: Re: reiserfs performance on ssd
Date: Thu, 27 Apr 2006 10:28:21 -0400
Message-ID: <e692861c0604270728p2aa4a4e0i70d1ad43a3da2fcf@mail.gmail.com>
References: <20060427151655.8b771812.pegasus@nerv.eu.org>
	 <20060427134702.GA8202@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28530-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060427134702.GA8202@favonius>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: Jure Pe??ar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

On 4/27/06, Sander <sander@humilis.net> wrote:
> > I have a simple solid state disk to play with here.
> > See http://nerv.eu.org/iram/
>
> Interesting review, thanks.
>
> To get better reliability you could raid1 them.
> I guess this is a 'must' anyway when used in servers (just like with
> harddisks).
>
> Have to try this product myself..

Because they have no ECC most failures will just be completely silent
data corruption.
A sadly useless device.
