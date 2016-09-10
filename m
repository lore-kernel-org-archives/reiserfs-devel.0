From: Mettavihari D <tv.lists@gmail.com>
Subject: Fwd: options in reiser4
Date: Sat, 10 Sep 2016 19:08:03 +0530
Message-ID: <CAMRsyOdr43GheHUEUzhqHfEO_iie=ZD1i+BzRTfUwQUxVzLvaQ@mail.gmail.com>
References: <CAMRsyOdqkwPq_UGRVR0DyNrptrHtJmR2R-1ifGS-p+V+=GoOFQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=2wjFWTTxzbEjlrXUmgavYpKw0n+HOYhySJKQTPDgpoU=;
        b=AEr7DkFQxo1lneQzuDGbEZyrWbfkdXfl9c76qXDDuoNThFIQCZrhrPytcl7ZPfVPW0
         fUtvxzZtyc2sYHNNmI0R+tZ+TKFim598zFyjDQV7v6SJjL4+TiN+cwJIJE6Mc1JpmdSD
         TbaGvsEgwiTZv7M5E4QpoQWl2ftlDjs9ojXgIXZbXbBGdKUW5bv1AJsCt1a+YTz5UT2M
         ktzph0Tra32VKWPEbPBYes3JT/JpLf81EyEZMxJuJ8IW4xCkJZxpErkuXpo6Gt/dutXJ
         hMHOQl53Jm+3loWfAlfu4xXMYVhT6zpkXJ7ftZUmTTC+jBtuaeBLMkv/z8xCKcZu3Afu
         FQOw==
In-Reply-To: <CAMRsyOdqkwPq_UGRVR0DyNrptrHtJmR2R-1ifGS-p+V+=GoOFQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Reiserfs Devel <reiserfs-devel@vger.kernel.org>

Greetings,

I have been using reiserfs for several years and I have been happy
with the Filesystem

One thing that has been very useful in the fs is
Options:
  -B | --badblocks file            store all bad blocks given in file on the fs

I today installed reiser4 to see how the new reiser4 was, however I did not find
Options:
  -B | --badblocks file            store all bad blocks given in file on the fs

This is what -h give me
Usage: mkfs.reiser4 [ options ] FILE1 FILE2 ... [ size[K|M|G] ]
Mkfs options:
  -s, --lost-found              forces mkfs to create lost+found
                                directory.
  -b, --block-size N            block size, 4096 by default, other
                                are not supported at the moment.
  -U, --uuid UUID               universally unique identifier.
  -L, --label LABEL             volume label lets to mount
                                filesystem by its label.
Plugins options:
  -p, --print-profile           prints the plugin profile.
  -l, --print-plugins           prints all known plugins.
  -o, --override TYPE=PLUGIN    overrides the default plugin of the type
                                "TYPE" by the plugin "PLUGIN" in the
                                profile.
Common options:
  -?, -h, --help                prints program usage.
  -V, --version                 prints current version.
  -y, --yes                     assumes an answer 'yes' to all questions.
  -f, --force                   makes mkfs to use whole disk, not
                                block device or mounted partition.
root@edu-SVE1713C5E:/root#

Please let me know if this option is available or not in the new version.

with metta
Mettavihari
