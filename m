From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Further work on reiser4: discard support and performance issues
Date: Mon, 07 Jan 2013 05:42:41 +0400
Message-ID: <1856576.kOCPiaH0RB@intelfx-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:user-agent
         :mime-version:content-transfer-encoding:content-type;
        bh=GPsIJg1BM4khHe4BN0j6P0lux0CRVijMJD3i6QEoQzQ=;
        b=TvdkJc4ss70D7XTcXZ+YeTb5RrU8P0T2V/vOmMHJmNUJw+9BuUOYcjscZFKnVFhHRO
         xIe4kh0EtaJ0C5NucCSxIDo5kLW9XD+o1yVjarIXfZpkwQV2uegV6i8GizKhAKco0EHT
         7NLWZneC9RayvuekQbDhquQJpdKW2T9wUdVf8IMp2UICXbVrHxSepKo89Y13J4tlZsiW
         Pv+l+Bk/vUefe+7cZudJg/D2OSTrurG9/Lp9D89XoNiz5zCDnjB/txuclPKNDsj8V+Ho
         t2q+G0y+FRBBdzsbBt7m9PThXSCeRLB/1WsLA8WLeqS83o4ggvP2Xark15OP2jUrpXW+
         4c6w==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: edward.shishkin@gmail.com
Cc: reiserfs-devel@vger.kernel.org

Hi again Edward,

Here's what I want to try to do with reiser4 in meantime. I'd appreciate some 
hints on that all...

So, first thing I'd like to implement is TRIM/discard support, both online
(via -o discard) and in a separate FITRIM ioctl().
That's just because I've got an SSD two days ago and thus now have to use in 
rootfs some discard-aware fs like ext4.

And then I want to do something with performance: sometimes during heavy I/O 
to a slow /home storage (especially when it's multithreaded) many processes, 
including the DE, just get stuck in "D" state and sit there for a minute or 
two with load average of apx. 5.5 (on a hyperthreaded 2-core CPU).

For the first, I can look into other filesystems' implementations, but I'll 
probably be unsure at which layer to put the actual discard call (in order not 
to break reiser4's transactional nature).
And for the second, I just don't know why does that happen. Can it be due to 
some r4-specific things/issues or that's just a horribly slow random access 
speed of my hw?

Thanks,
Ivan.
