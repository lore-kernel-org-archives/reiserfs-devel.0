From: Oleg Drokin <green@namesys.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 15:10:45 +0300
Message-ID: <20021223151045.A7697@namesys.com>
References: <3E06F360.7000708@namesys.com> <20021223120357.GC13460@hvs.envisage.co.za>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12204-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021223120357.GC13460@hvs.envisage.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hendrik Visage <hvisage@envisage.co.za>
Cc: ReiserFS <reiserfs-list@namesys.com>

Hello!

On Mon, Dec 23, 2002 at 02:03:57PM +0200, Hendrik Visage wrote:

> Another slowness (especially with reiserfs3 without the notails option) 
> is "dd if=/dev/zero of=/swapfile bs=1k count=1024k"

Well, I'd say that artrifical limiting of amount of data to be transferred
is a cheating ;).
Reiser4 is not vulnerable to this, though.

Bye,
    Oleg
