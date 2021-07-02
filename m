From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Subject: Verify the items that we read from blocks
Date: Fri, 2 Jul 2021 20:35:41 +0530
Message-ID: <YN8rRYxhZvAa+VxU@fedora>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=lzeTdJJkCqv5mk9Gasn/+NrDrHS7Qalj8jBb3up29Zc=;
        b=Kkbk7AWBs4JpZjwH9Qna4U1kLDZHzbIKcEdUCwdclmma4xfgkw9rq2K8pbvLWKorca
         76RDSResPlYstHCyQPuJisbSgEj7jbNFqBy2XF7EUdwM5fUyCN8SsWZGkN7G0KMYh3sa
         TlBMDGe1IB8CrqwesdFF7eVIdiPjpScQAkuOA61S56E44VJHuh3Vcp7buwQAwV4LVpLj
         O/fJo+TANtvdK8hZSeMp3eB6jnUuS0/kDaKFJUUM1c0rzYbxSPZk5RgPHn+fgarzzWSP
         9QhY8AT0VSzbPusqZy7cOhEaL/neNMAwB7A5S4SQFd1n/sRI+8YudT1al6eUWLmKfxTb
         h5pQ==
Content-Disposition: inline
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jack@suse.cz, rkovhaev@gmail.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

I was trying to work on this[1] bug. After a lot of reading the code and
running it under gdb, I found out that the error happens because
syzkaller creates a segment with raw binary data in the reproducer[2],
that has the wrong deh_location for the `..` directory item. (The value
is 0x5d (93), where as it should have been 0x20 (32).)

I think that the solution would involve checking the items that we read,
and verify that they are actually valid. But this check could actually
happen in two places:

- First idea would be to check as soon as we read a
  block, and one way of doing that would be adding a wrapper around
  ll_rw_block that validates the leaf node blocks that we read. The
  benifits to this would be that since we're solving the problem at it's
  root, very few functions would have to be changed. But I don't know
  how much of a performance hit would it be.

- Second idea would be to do these validation checks lazily. This should
  be faster than the first idea, but this would involve changing the
  code at more places than in the first idea.

For how the validation happens, the first idea that comes to mind is
reading the item headers from the block that we read and verifying if
the header is valid, and if the items themselves are valid according to
the header.

It's very likely that better approaches to this problem exist, that I
wasn't able to think of. I wanted to discuss about this before pursuing
the solution any further. Would such a change be accepted?

If there are better approaches, or if I am looking at this bug from an
incorrect perspective, please let me know.

Thank you,
Shreyansh Chouhan

--

[1] https://syzkaller.appspot.com/bug?id=d8c00bae1644df59696f2d74d1955fd286691234
[2] https://syzkaller.appspot.com/text?tag=ReproC&x=13f9f338d00000

(PS: In the reproducer, the segment partition with data at 0x20011100 in
the execute_once function has the faulty directory item.)
