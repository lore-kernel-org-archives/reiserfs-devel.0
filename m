From: Alexandre Oliva <aoliva@redhat.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Wed, 21 Sep 2005 05:15:30 -0300
Message-ID: <or1x3i3kgt.fsf@livre.oliva.athome.lsd.ic.unicamp.br>
References: <nikita@clusterfs.com>
	<17197.15183.235861.655720@gargle.gargle.HOWL>
	<200509192316.j8JNFxY8030819@inti.inf.utfsm.cl>
	<feed8cdd0509192057e1aa9e3@mail.gmail.com>
	<or4q8fvd6r.fsf@livre.oliva.athome.lsd.ic.unicamp.br>
	<feed8cdd050920155714510453@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26195-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <feed8cdd050920155714510453@mail.gmail.com> (Stephen Pollei's
 message of "Tue, 20 Sep 2005 15:57:31 -0700")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stephen.pollei@gmail.com
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Nikita Danilov <nikita@clusterfs.com>, Denis Vlasenko <vda@ilport.com.ua>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Sep 20, 2005, Stephen Pollei <stephen.pollei@gmail.com> wrote:

> it takes gcc -Wall test_proto.c --std=c99 -pedantic-errors to cause it
> not to create the a.out .
> So gcc should have caused an error as I didn't set --std=gnu99 .. bad compiler.
> So I don't know howto get gcc to follow the standards in this area,
> that sounds like a good thing to require.

gnu99 is the default.  Also, the standard doesn't talk about errors or
warnings, it only requires diagnostics for ill-formed code.  Deciding
what kind of diagnostic to issue is a compiler implementation
decision.

-- 
Alexandre Oliva         http://www.lsd.ic.unicamp.br/~oliva/
Red Hat Compiler Engineer   aoliva@{redhat.com, gcc.gnu.org}
Free Software Evangelist  oliva@{lsd.ic.unicamp.br, gnu.org}
