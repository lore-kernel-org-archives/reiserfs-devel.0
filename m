From: michael chang <thenewme91@gmail.com>
Subject: Re: Reiserfsck can't fix FS
Date: Mon, 17 Oct 2005 15:34:49 -0400
Message-ID: <b14e81f00510171234l4addda48kf73e962b384be6e6@mail.gmail.com>
References: <1129303303.3370.4.camel@desktop>
	 <200510142008.42253.vitaly@namesys.com>
	 <1129484435.16949.1.camel@desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1129484435.16949.1.camel@desktop>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Raschbacher <lordvan@lordvan.com>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

On 10/16/05, Thomas Raschbacher <lordvan@lordvan.com> wrote:
> Hi
>
> just a quick addition:
>
> I ran this:
>
> desktop lordvan # dd if=3D/dev/discs/disc2/part6  of=3D/dev/null bs=3D8k
> 1192384+0 records in
> 1192384+0 records out
> 1209296+0 records in
> 1209296+0 records out
> 1275725+0 records in
> 1275725+0 records out
> 1326505+0 records in
> 1326505+0 records out
> 1790232+0 records in
> 1790232+0 records out
> 2255571+0 records in
> 2255571+0 records out
> 2447343+0 records in
> 2447343+0 records out
> 6220163+1 records in
> 6220163+1 records out
>
> as you see it produced no errors at all so the HDD can be read fine. any
> idea what could cause the problem?

IIRC, if there were no errors, dd wouldn't have repeatedly told you
what records in/out it'd completed, unless you manually tell it to do
so.

If you didn't touch it and it's saying this, then dd is skipping over
some dysfunctional blocks.  Otherwise, then yes, dd can read it fine
(although that doesn't say anything about the data's integrity).

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
