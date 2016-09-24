From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 Upstream Git Repositories on GitHub
Date: Sat, 24 Sep 2016 22:16:55 +0200
Message-ID: <57E6DF37.1050702@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-transfer-encoding;
        bh=CKRhSUpmiWd/KhgjvLnsKSwbsw8tV63Udjmsm28xkTM=;
        b=BxEsK4btKWnHJV+xlP/x0aYjivU6/QE2sYymafIV9Y7Vzitv7oWHshvi+kkh9bLawU
         awAqWECQi9A3MN+7WbL4WLLKvSNmnzNHSj1hvERQUl74kfe7V01ebMK9wN8ohur3OYfm
         tYSe9ZcfFqwDhXCd7S0YcbS1EcyY6j935kqVvASIjaOXVGYU9LDhoJH2L5HqXq7uzyFy
         fDSkBggeHwx4whGf5VVVzxQOzuYo4o6kSqHWA/NiI6HkUsRH96pZ5F3PEDkHO2jTzhNZ
         mKeqj2m35cZ1MIoMQ9bMhwyJeVO90fAMnAM9Vtcr248idMcoDw5aacwabKslX8x5q8Ab
         npaQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Hello everyone,

I have set up the updated Namesys repositories at my Github page.
Those repositories are supposed to contain the latest updates in
the (stable) master branch and in other (experimental) branches that
I'll announce.

1) https://github.com/edward6/reiser4

This is a "standalone" reiser4 tree, which doesn't include specific
changes of Linux kernel needed for reiser4 port. Such changes can be
found at the project's page on Sourceforge:
https://sourceforge.net/projects/reiser4/

An example of work with the standalone reiser4 tree:

. Patch the respective kernel with the latest available stuff from
   Sourceforge;
. cd to the "fs" directory;
. delete the directory reiser4;
. instead of the deleted stuff clone the standalone reiser4
   repository from Github;
. build and install as usual.

2) Libaal and Reiser4progs:

https://github.com/edward6/libaal
https://github.com/edward6/reiser4progs

Before building Libaal and Reiser4progs execute the ./prepare script,
which will create files needed for build process.

Thanks,
Edward.
