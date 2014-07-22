From: Christian Stroetmann <stroetmann@ontolab.com>
Subject: Re: Reiserfs 4
Date: Tue, 22 Jul 2014 17:17:55 +0200
Message-ID: <53CE80A3.5040901@ontolab.com>
References: <CAMRsyOdq8mTCtxGH0h1m4pTOKZoGvk+N0aG4ADSFBx5qSHmUAw@mail.gmail.com>	<CAMRsyOd8j3oQ2OACOBnXBR4Zyt09AU48KNmPPkm2qj01BMA9Aw@mail.gmail.com> <20140720194256.551f51f9@Ulf.tvoe.tv> <53CCD8C8.4030900@niksula.hut.fi> <90CADE8A1B1C4C9FBBDEC0AB7376599D@DuSTmanPC> <53CE54ED.70001@ontolinux.com> <5D2089180C8E421EA52837263C62D58C@DuSTmanPC>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5D2089180C8E421EA52837263C62D58C@DuSTmanPC>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Horne <daniel.horne@gmail.com>
Cc: Linux Reiserfs Devel <reiserfs-devel@vger.kernel.org>

On the 22nd of July 2014 15:48, Daniel Horne wrote::
>> I promised not to sent any messages to this maling-list anymore, but 
>> this is an exception because the work of my company and me is 
>> directly addressed in a way that might mislead members of this 
>> mailing-list and the broader public and also might have been an 
>> attack on our reputation.
>
> It wasn't intended as such - I'm new to the field of formal 
> verification and wasn't aware of this work.
>
> Thanks for the information, though. I'll read through those links.
>
> -- 
> DH
>

I do apologize for any harsh statement.

To the subject of formal verification:
This is a highly complex task and if it makes sense to formally verify 
R4 has to be approached from several sides:
1. Is R4 in a state that it is matured enough?
2. File systems for general use are a little bit different than the L4 
microkernel, so the complexity that has to be verified might be higher.
3. Is the environment verified as well, for example the operating system 
kernel of Linux?

Actually, I do not know if it makes sense to do it, but if you attempt 
it, then I will have a look on your results.



Best regards
Christian Stroetmann

