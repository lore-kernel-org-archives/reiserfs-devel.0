From: "Daniel Horne" <daniel.horne@gmail.com>
Subject: Re: Reiserfs 4
Date: Mon, 21 Jul 2014 21:26:58 +0100
Message-ID: <90CADE8A1B1C4C9FBBDEC0AB7376599D@DuSTmanPC>
References: <CAMRsyOdq8mTCtxGH0h1m4pTOKZoGvk+N0aG4ADSFBx5qSHmUAw@mail.gmail.com>	<CAMRsyOd8j3oQ2OACOBnXBR4Zyt09AU48KNmPPkm2qj01BMA9Aw@mail.gmail.com> <20140720194256.551f51f9@Ulf.tvoe.tv> <53CCD8C8.4030900@niksula.hut.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:from:to:references:in-reply-to:subject:date:mime-version
         :content-type:content-transfer-encoding;
        bh=Vz5+5eRZqY0tUqKI120M7skEvdymU94xDa7vCFfioQ4=;
        b=Nj/qJfO0jKII7+enBGmzk8FR0PNoCOvVvyflaM/S7UVB7jOdM+hTapLpgkI88SI/CW
         6UtmZm21aT3W7o71CbJR0o7lpQEXUHzp09Mi7E3VgSWSS2QSdGivqsPkmgWmQooO2p7K
         wz+EQ1ydehiRJ8tyTBzjKYwsvt6wbYR3UqDdP8gK8Y25N/vf5DkAYrkjo7DQGg+/RONb
         0ImX46m1ag6k80IvnZ59eSCzfV9WjbGzAzouIEZUY4skx/mBFyTLTLsgqZZNgjv+YEnC
         cpOJCP7rUqAtdTKqQuRQbuqMp+9qEjHrjlmf2A7Dr+l4UD/e9d6JACHjAncJ3Z1DqvZB
         dX1A==
In-Reply-To: <53CCD8C8.4030900@niksula.hut.fi>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>


> Speaking of reiser4, unfortunately I would not expect it to be 
> recommendable as a
> viable production-ready upgrade path for 3.6 in the near future. Sadly, 
> there's just
> not enough resources backing up development at the moment. Feel free to 
> change that
> though ;-)
>

I wonder if there would be any interest in a project to formally verify 
Reiser4? I mean, who needs a lot of testing effort when you've got a machine 
checked proof.

SeL4, for example, is a microkernel of ~84000 lines iirc, and had its major 
correctness criterion proved through the isabelle/HOL theorem prover. 
Reiser4 is on the same order of magnitude in terms of lines of code, so 
could possibly be proven in roughly the same amount of effort. We could 
probably restrict the scope of a verification project to the consistency of 
the on-disk store to start with, and add in other correctness criteria (such 
as deadlock avoidance) later.

I recall hans saying that he'd proven the leaf-first locking scheme of 
reiser4 - Did he do this as an informal pen-and-paper proof, or is there a 
proof script for a proof assistant lying around somewhere?

--
DH 

