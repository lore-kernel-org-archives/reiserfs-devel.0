From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 11:24:29 +0400
Message-ID: <42BFA9AD.5090000@yandex.ru>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl> <42BCD93B.7030608@slaphack.com> <200506251420.j5PEKce4006891@turing-police.cc.vt.edu> <42BDA377.6070303@slaphack.com> <200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu> <42BDC422.6020401@namesys.com> <42BE3645.4070806@cisco.com> <e692861c05062522071fe380a5@mail.gmail.com> <42BE563D.4000402@cisco.com> <42BE5DB6.8040103@slaphack.com> <200506261816.j5QIGMdI010142@turing-police.cc.vt.edu> <42BF08CF.2020703@slaphack.com> <200506262105.j5QL5kdR018609@turing-police.cc.vt.edu> <42BF2DC4.8030901@slaphack.com> <200506270040.j5R0eUNA030632@turing-police.cc.vt.edu> <87y88webpo.fsf@evinrude.uhoreg.ca> <200506270459.j5R4xdZp005659@turing-police.cc.vt.edu>            <42BF9489.9080202@slaphack.com> <200506270624.j5R6OWFn008836@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24675-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506270624.j5R6OWFn008836@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: David Masover <ninja@slaphack.com>, Hubert Chan <hubert@uhoreg.ca>, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Valdis.Kletnieks@vt.edu wrote:
> For more fun, consider how you can write 1 megabyte of data to a file,
> lseek to the beginning and start writing again - and you go over quota
> on the *second* write even though you're over-writing already existing
> data.  Can happen if you're compressing, and the second write doesn't
> compress as well as the first. (To be fair, we already have similar
> issues with sparse files - but at least 'tar --sparse' has an easy way
> to deal with it compared to this. ;)
Sorry, may be I'm out of the context, but here is my view.

In case of compression in the kernel space you may take into account the 
size of file in the _uncompressed_ form and how much it takes in the 
compressed form - doesn't matter. So, no problems with rewriting.

Moreover, are you sure that the current quota model is enough for FSes 
with on-fligh compression? The model should probably be extended/changed.

Problems with quota and accounting is not the reason to forbid the 
on-flight compression. And they don't have to co-exist well.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
