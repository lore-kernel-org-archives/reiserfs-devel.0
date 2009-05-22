From: thomas_tsai <thomas@nchc.org.tw>
Subject: compile error from libreiser4
Date: Fri, 22 May 2009 00:42:03 -0700 (PDT)
Message-ID: <23665978.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


Hello reiserfs

I use libreiser4.a to build a small test and get an error

ex:
I write a test reiser4version.c
#include <stdio.h>
#include <reiser4/libreiser4.h>

int main(int argc, char **argv){

    const char      *lib_ver;
    lib_ver = (const char *)libreiser4_version();
    printf("%s\n", lib_ver);
    return 0;

}

compile it
gcc reiser4_version.c -lreiser4 -laal

get error message

   In function `reiser4_profile_override':
    (.text+0x18d): undefined reference to `misc_str2long'
    collect2: ld returned 1 exit status

IMHO, It's a link problem about misc_str2long because the function is
defined in libmisc/misc.c.

    nm libreiser4.a | grep misc_str2long
    U misc_str2long

    nm libmisc.a | grep misc_str2long
    000003d0 T misc_str2long

My coworkers, Jazz Wang fix the problem and  it works well now...

the patch file here
http://www.nabble.com/file/p23665978/profile.patch profile.patch 

I really hope it could be patch to upstream in the future version.
tkx in advanced.
-- 
View this message in context: http://www.nabble.com/compile-error-from-libreiser4-tp23665978p23665978.html
Sent from the ReiserFS - General mailing list archive at Nabble.com.

