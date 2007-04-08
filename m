From: johnrobertbanks@fastmail.fm
Subject: Re: COMPILING AND CONFIGURING A NEW KERNEL.
Date: Sat, 07 Apr 2007 18:11:16 -0700
Message-ID: <1175994676.2359.1183513514@webmail.messagingengine.com>
References: <46157B5B.5000602@gmail.com>
   <1175817921.18400.1183285196@webmail.messagingengine.com>
   <1175909205.905.1183425104@webmail.messagingengine.com>
   <1175931932.27274.1183445262@webmail.messagingengine.com>
   <13183.1175965022@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <13183.1175965022@turing-police.cc.vt.edu>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Ignatich <ignatich@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org


> It is *highly* recommended that you change the kernel identifier at
> least slightly, so that you can install '2.6.20-1.local' without
> overlaying
> the vendor-supplied 2.6.20-1 kernel.  Among other things, this lets you
> boot back to the equivalent code level in the vendor kernel, 
> so you can figure
> out if it's your .config file that's broken, or if you hit a bug
> upggrading from 2.6.19-10 to 2.6.20-1.

I agree. I think your advice is *highly* recommended.

I had this problem once after forcing an upgrade, which removed the
working kernel. I just booted the kernel and stuff, from another
partition.

John.
-- 
  
  johnrobertbanks@fastmail.fm

-- 
http://www.fastmail.fm - The way an email service should be

