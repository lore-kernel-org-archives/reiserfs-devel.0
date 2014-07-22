From: Christian Stroetmann <stroetmann@ontolinux.com>
Subject: Re: Reiserfs 4
Date: Tue, 22 Jul 2014 14:11:25 +0200
Message-ID: <53CE54ED.70001@ontolinux.com>
References: <CAMRsyOdq8mTCtxGH0h1m4pTOKZoGvk+N0aG4ADSFBx5qSHmUAw@mail.gmail.com>	<CAMRsyOd8j3oQ2OACOBnXBR4Zyt09AU48KNmPPkm2qj01BMA9Aw@mail.gmail.com> <20140720194256.551f51f9@Ulf.tvoe.tv> <53CCD8C8.4030900@niksula.hut.fi> <90CADE8A1B1C4C9FBBDEC0AB7376599D@DuSTmanPC>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <90CADE8A1B1C4C9FBBDEC0AB7376599D@DuSTmanPC>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Reiserfs Devel <reiserfs-devel@vger.kernel.org>

Am 21.07.2014 22:26, schrieb Daniel Horne:
>
>> Speaking of reiser4, unfortunately I would not expect it to be 
>> recommendable as a
>> viable production-ready upgrade path for 3.6 in the near future. 
>> Sadly, there's just
>> not enough resources backing up development at the moment. Feel free 
>> to change that
>> though ;-)
>>
>
> I wonder if there would be any interest in a project to formally 
> verify Reiser4? I mean, who needs a lot of testing effort when you've 
> got a machine checked proof.
>
> SeL4, for example, is a microkernel of ~84000 lines iirc, and had its 
> major correctness criterion proved through the isabelle/HOL theorem 
> prover. Reiser4 is on the same order of magnitude in terms of lines of 
> code, so could possibly be proven in roughly the same amount of 
> effort. We could probably restrict the scope of a verification project 
> to the consistency of the on-disk store to start with, and add in 
> other correctness criteria (such as deadlock avoidance) later.
>
> I recall hans saying that he'd proven the leaf-first locking scheme of 
> reiser4 - Did he do this as an informal pen-and-paper proof, or is 
> there a proof script for a proof assistant lying around somewhere?
>
> -- 
> DH
> -- 

I promised not to sent any messages to this maling-list anymore, but 
this is an exception because the work of my company and me is directly 
addressed in a way that might mislead members of this mailing-list and 
the broader public and also might have been an attack on our reputation.

FYI, I would like to mention the following points, though only point 1. 
and point 2. might be of interest for R4 developers and followers:
1. The general concept about a formally verified R4 was already made in 
the November 2006 with the start of OntoLinux [1] (see its 
characteristics on the webpage Overview [2]). At that time, the OntoFS 
[3] was based on R4.
2. Actually, OntoLinux is also based on the L4 microkernel (see the 
first section of the webpage Components [4] and its section OntoL4 [5]). 
Hence, to use a formally verified L4 microkernel was suggested and 
planned with OntoLinux even before the National Information and 
Communications Technology Centre of Excellence Australia (NICTA) 
conducted the formal verification of its L4 variant with only "7,500 
lines of C code" in the October of 2009 (its case has been investigated 
by us and documented on OntomaX [6]). There are other issues related 
with the L4 variant of NICTA that I do not want to discuss here. But the 
similarities between our works are no surprise.
3. HiLog is included in the OntoBot component [7] by XSB [8] that 
permits limited High-Order Logic (HOL) programming, though HOL is not 
needed at all due to the rewriting logic of Maude [9] included as well 
in the OntoBot.
4. The generic proof assistant Isabelle [10] with its instance 
Isabelle/HOL was added to the section Formal Verification of the webpage 
Links to Software [11] with the OntoLinux Website update of the 23th of 
August.2009 (see the related message on OntomaX [12]).
5. OntoFS is not based on R4 anymore since quite some time now, but on 
OntoBase [13].

Last but not least, I am sure that pen-and-paper was the method at that 
time, if a proof was done at all.



Have fun with (Onto)logics
Christian Stroetmann

[1] OntoLinux www.ontolinux.com
[2] OntoLinux - Overview www.ontolinux.com/technology/overview.htm
[3] OntoLinux - OntoFS www.ontolinux.com/technology/ontofs.htm
[4] OntoLinux - Components www.ontolinux.com/technology/components.htm
[5] OntoLinux - Components - OntoL4 
www.ontolinux.com/technology/components.htm#ontol4
[6] OntomaX - News - 2009 - August 
www.ontomax.com/newsarchive/2009/august.htm21.August.2009
[7] OntoLinux - Components - OntoBot 
www.ontolinux.com/technology/components.htm#ontobot
[8] XSB xsb.sourceforge.net/
[9] Maude maude.cs.uiuc.edu/
[10] Isabelle www.cl.cam.ac.uk/research/hvg/Isabelle/
[11] Links to Software - Formal Verification 
www.ontolinux.com/community/software.htm#formalverification
[12] OntomaX - News - 2009 - August 
www.ontomax.com/newsarchive/2009/august.htm#23.August.2009
[13] OntoLinux - OntoBase www.ontolinux.com/technology/ontobase/ontobase.htm


