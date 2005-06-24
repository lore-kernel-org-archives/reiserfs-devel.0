From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 14:31:07 +0400
Message-ID: <m1slz8oxlg.fsf@clusterfs.com>
References: <200506221733.j5MHXEoH007541@laptop11.inf.utfsm.cl>
	<42B9DD48.6060601@slaphack.com>
	<17081.58619.671650.812286@gargle.gargle.HOWL>
	<42BAC668.2030604@slaphack.com>
	<17083.14428.546772.353003@gargle.gargle.HOWL>
	<42BBAA0F.2020404@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24544-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BBAA0F.2020404@namesys.com> (Hans Reiser's message of "Thu,
 23 Jun 2005 23:37:03 -0700")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, "Artem B. Bityuckiy" <dedekind@yandex.ru>, Markus Trnqvist <mjt@nysv.org>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, hch@infradead.org, jgarzik@pobox.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> writes:

> Nikita, I respectfully disagree with what you say about the state of our
> atomicity code.   It is not so far away as you describe, and probably 6
> man weeks work could polish it off.  You don't see the value in what I
> define as useful, namely atomicity without isolation.  Since you don't
> see that, it is harder for you to see that something is close to working
> and just needs 6 weeks of someone who groks what I am asking for.

No, I see the value of "atomicity", and think it is very useful. What I
don't see the value of is the making of premature claims.

_When_ reiser4 has atomic write(2), you have full right to call it
atomic, not before.

_When_ reiser4 is tested through objective benchmark-set exercising
various workloads, you can refer to these benchmarks as the proof of
reiser4 technical superiority, not before.

On a more personal note, I invested large amount of my time and effort
into developing reiser4, and I feel attached to it and to the great
ideas embodied in it. For reiser4 to rot on the forgotten shelf in
obscurity is the thing I want least. I want it to be included into
mainline kernel, but for this to happen, you have to take more realistic
stance towards err... reality.

>
> Hans

Nikita.
