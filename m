From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH] reiser4: support user namespaces and kuid_t/kgid_t.
Date: Thu, 12 Dec 2013 16:59:20 +0400
Message-ID: <2002458.foDNUCuAmH@intelfx-laptop>
References: <1386828002-30019-1-git-send-email-intelfx100@gmail.com> <20131212061154.Horde.zwSLk0nPfnKLDVDvwibz-g2@mail.thieu.so>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=ay8TwFeFYJakFbJ/oJFIwAPexQ49gcVK1fZ8stqWrTU=;
        b=dUxpe9NvgKnnqMRfhbhAJHDH9gN9aKD30omrhRIcrRviD+47fdWUVO7sVrg3snMgVS
         XmGDP8La8rKgw54X5oFGVZc77P8Hy1dnPAFLB/16s7rkhoslwsPbGyMncT5cG9v4JYxb
         Ky3PAHwqi/3oCfr+YfGN8DVJ3nWFSLyFzeOSfdU3rK3yM438QNpfQJPTUjeW0H2cE5ce
         fYnsvkFPVaP9KdAcCrmXYOxWbdF36sZ6wFVyqJ1e9QWC4IS6C1hJ1QugwZ9dXMjHXZWf
         swwx0ujZIAVFo+Ao65dTUf77b1vleqDmLNleiP8o7vcuXmF05oW4a9YoqOdYFmDBm2ir
         zxCw==
In-Reply-To: <20131212061154.Horde.zwSLk0nPfnKLDVDvwibz-g2@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Mathieu Belanger <m@thieu.so>
Cc: reiserfs-devel@vger.kernel.org

On Thursday 12 December 2013 at 06:11:54, Mathieu wrote:
> I have updated the git with Ivan patches.
> 
> 
https://github.com/DestroyFX/reiser4/commit/a982eb9dbd56d99c9b369d7261c0f744b09ff0a8

Hi!

BTW, I also try to maintain a reiser4 git repo, backporting down to 3.2.

https://github.com/intelfx/reiser4

-- 
Ivan Shapovalov / intelfx /
