From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 0/2] reiser4: node41 layout support
Date: Tue, 10 Feb 2015 18:58:22 +0100
Message-ID: <54DA46BE.80302@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=qKc169rdIktaIVAy3DvPJ0dKje31BcsubReAzUYaW5A=;
        b=EME08/jiUeqeU3qDK009GSGZKomtwBR2DZukgLwUYkpy+zFBd0ZMeiJRJC7DJFy8PD
         5ROfGzkz12HKRY0ZeIw1zg8VM8Ne+PTY9EyuMcmRZxTYaa+x6gKQYaRM7iXI4iBpNHgl
         807KbvjqjPWjvWw2mY1lPTCEsMaAC55Amu7GARJeS5lKK+wawmFVOASh6TZDtqj5vuEZ
         ktjZ1CHQ5X6xU50KWcwRz5pFMbIP7E7UokHf87cn4AqDCgZVPiENcrzP48ZgrnAfpG6F
         3WpKPb8Jo7b4v8q/SzzboEUzCNNUwnwBdzOB2zgKZevN/wdR+ncDcfYqGphe+GMpDNT9
         uKnQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hi all,

The following patches introduce a new node format(plugin): node41.
The new node layout (node41) contains a 32-bit field. This is the
single difference from the old node format (node40).

The new field will be for meta-data checksums. Currently it is
filled with zeros.

This is an important example of how to add a plugin to reiser4.
Earlier file system developers used to design disk layouts "once
and forever". Any change in disk layouts of such poorly designed
file systems led to compatibility issues and ugly workarounds.
With reiser4 we don't have such problems.

Low-level interface to access the new field

1) in reiser4:

nh41_get_csum(node41_header *head);
nh41_set_csum(node41_header *head, __u32 val);

2) in reiser4progs:

nh41_get_csum(reiser4_node_t *node);
nh41_set_csum(reiser4_node_t *node, uint32_t val);

How to test the new feature:
WARNING: don't use it for important data for now!!!

. format a reiser4 partition with mkfs option "-o node=node41";
. mount as usual;
. use as usual: all previously implemented functionality has to
   work with the new node41 plugin;
. umount;
. debugfs.reiser4 -t /dev/xxx prints a new field CSUM for nodes
   of the new format (0 for now);
. fsck has to check/repair file systems with node41 layouts
   properly.

Please, report if any problems,

Thanks,
Edward.
