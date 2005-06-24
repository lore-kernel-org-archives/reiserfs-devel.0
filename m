From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Thu, 23 Jun 2005 23:37:03 -0700
Message-ID: <42BBAA0F.2020404@namesys.com>
References: <200506221733.j5MHXEoH007541@laptop11.inf.utfsm.cl>	<42B9DD48.6060601@slaphack.com>	<17081.58619.671650.812286@gargle.gargle.HOWL>	<42BAC668.2030604@slaphack.com> <17083.14428.546772.353003@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24534-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17083.14428.546772.353003@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <nikita@clusterfs.com>
Cc: David Masover <ninja@slaphack.com>, "Artem B. Bityuckiy" <dedekind@yandex.ru>, =?UTF-8?B?TWFya3VzIFTQlnJucXZpc3Q=?= <mjt@nysv.org>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, hch@infradead.org, jgarzik@pobox.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Nikita, I respectfully disagree with what you say about the state of our
atomicity code.   It is not so far away as you describe, and probably 6
man weeks work could polish it off.  You don't see the value in what I
define as useful, namely atomicity without isolation.  Since you don't
see that, it is harder for you to see that something is close to working
and just needs 6 weeks of someone who groks what I am asking for.

Hans

