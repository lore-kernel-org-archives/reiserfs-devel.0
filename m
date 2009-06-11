From: "Trenton D. Adams" <trenton.d.adams@gmail.com>
Subject: Re: [PATCH 1/2] kill-the-bkl/reiserfs: acquire the inode mutex safely
Date: Wed, 10 Jun 2009 18:42:38 -0600
Message-ID: <9b1675090906101742g64263889j1c4eb47f894072c4@mail.gmail.com>
References: <1242496922-6330-1-git-send-email-fweisbec@gmail.com>
	 <1242496922-6330-2-git-send-email-fweisbec@gmail.com>
	 <9b1675090905292005p2b53de7dy9e36f84368d76f01@mail.gmail.com>
	 <4A296343.4050005@suse.com>
	 <9b1675090906051206we136e88k6a14194963726709@mail.gmail.com>
	 <4A29723C.2030102@suse.com>
	 <9b1675090906051257t5aad47capccfcf1c94f863a66@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=G9xX3URCFixFLAUCrvsnia4TpeuJXzjhx+EFG7aChmE=;
        b=W7ydsoXSq54APJkGllS+LAz0OI79fdtACVYV7wQWk4fF3udxNJSL7huJP+ym1RyGEA
         2k7yiotplMrU2SGM1uoi1TApVv9UozFHxHdP5Gx4sS8Sufv4FoR5bpYZQHk7ttd3vb2L
         8CM2CCOyAQ168LhA5Sma69dyggr5ciiunHej4=
In-Reply-To: <9b1675090906051257t5aad47capccfcf1c94f863a66@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, Reiserfs <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, Alexander Beregalov <a.beregalov@gmail.com>

I have not been seeing this with 2.6.30-rc7.  Perhaps it was resolved
in that version.  I'll let you know if it happens again.
