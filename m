From: Oleg Drokin <green@namesys.com>
Subject: Re: slow mount
Date: Thu, 12 Jun 2003 21:38:07 +0400
Message-ID: <20030612173807.GA31615@namesys.com>
References: <1055427629.1875.8.camel@terminus.zapto.org> <20030612144609.GA27645@namesys.com> <1055432836.8601.3.camel@terminus.zapto.org> <3EE8A2A0.2080500@namesys.com> <1055435090.2028.7.camel@terminus.zapto.org> <20030612172624.GG7319@namesys.com> <1055439217.2068.27.camel@terminus.zapto.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14528-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1055439217.2068.27.camel@terminus.zapto.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbie Hopkins <Herbie@Hopkins.net>
Cc: Hans Reiser <reiser@namesys.com>, Reiserfs <reiserfs-list@namesys.com>

Hello!

On Thu, Jun 12, 2003 at 06:33:37PM +0100, Herbie Hopkins wrote:

> I don't have the dubuging stuff on at the moment, I just compiled
> another kernel with it enabled to see what extra info it gave me.

Ah, I see.
Well, if the drive itself is inducing those delays, you cannot tell that from
fs driver, but you probably can look around with smartctl and see how many
relocated bad sectors it have and this kind of stuff.

Bye,
    Oleg
