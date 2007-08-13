From: "Vladimir V. Saveliev" <saveliev.v.v@gmail.com>
Subject: Re: [PATCH] reiserfsprogs: enforce 2^32-1 block limit
Date: Tue, 14 Aug 2007 00:16:56 +0300
Message-ID: <46C0CA48.20203@namesys.com>
References: <46C0A6CE.1010807@suse.com> <46C0C6D2.4020700@namesys.com> <46C0B7A0.3090605@suse.com>
Reply-To: vs@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:reply-to:user-agent:x-accept-language:mime-version:to:cc:subject:references:in-reply-to:content-type:content-transfer-encoding:from;
        b=fmo40VSRsyO592fNit2WX5s1+kV7eMhXUo2bsLpn2G6ZjK7mSXiizv5lzYxWkF4Y8CNSuVClnlS91UcRbOEHif0b+CRPiiJht80dcQyZcDEvBHDayqDr/iYULwDEPnS8/gkelOYBlDJZfYYsaO1efscCEcKfd3TUFYeeaTIg+OM=
In-Reply-To: <46C0B7A0.3090605@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Jeff Mahoney wrote:
> Vladimir V. Saveliev wrote:
>>> Hello
>>>
>>> Jeff Mahoney wrote:
>>>>  Currently, mkreiserfs on a block device >= 16 TiB will fail with this error:
>>>>  reiserfs_create_journal: cannot create a journal of 8193 blocks with
>>>>  18 offset on 0 blocks
>>>>
>>>>  The message doesn't adequately describe that the problem is that reiserfs
>>>>  supports file system sizes up to 2^32-1 blocks, and it silently overflows.
>>>>
>>>>  This patch treats the block device size, as well as the <blocks> command
>>>>  line parameter as __u64's, so that they can be safely compared to UINT_MAX.
>>>>
>>>>  If the block device is too large, 

You probably should also fix misc_device_count_blocks to return device
size in 64 bits. Currently it returns unsigned long.

we warn the user, offer to truncate the
>>>>  file system to 2^32-1 blocks, and confirm. This is overridable by the -f
>>>>  option, which will elect to truncate automatically.
>>>>
>>>>  If the user has specified a block count that is too large, we fail always
>>>>  since the user has provided invalid input.
>>>>
>>>>  Please apply.
>>>>
>>>> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>>>>
>>>> --- a/utils/mkfs/mkreiserfs.c	2007-08-13 13:34:15.000000000 -0400
>>>> +++ b/utils/mkfs/mkreiserfs.c	2007-08-13 14:42:02.000000000 -0400
>>> What did you diff against?
> 
> reiserfsprogs 3.6.20, though I think it was my development tree since a
> patch to a fresh tree comes up with offset -2, but otherwise applies.
> 
> -Jeff
> 
> 
>>>> @@ -29,6 +29,7 @@
>>>>  #include <time.h>
>>>>  #include <unistd.h>
>>>>  #include <errno.h>
>>>> +#include <limits.h>
>>>>  
>>>>  #ifdef HAVE_UNAME
>>>>  # include <sys/utsname.h>
>>>> @@ -438,6 +439,21 @@
>>>>      return val;
>>>>  }
>>>>  
>>>> +static __u64 str2u64 (char *str)
>>>> +{
>>>> +    __u64 val;
>>>> +    char *tmp;
>>>> +
>>>> +    val = (__u64)strtoll(str, &tmp, 0);
>>>> +
>>>> +    if (*tmp) {
>>>> +	reiserfs_exit (1, "%s: strtoll is unable to make an integer of %s\n",
>>>> +		       program_name, str);
>>>> +    }
>>>> +
>>>> +    return val;
>>>> +}
>>>> +
>>>>  
>>>>  static void set_block_size (char * str, int *b_size)
>>>>  {
>>>> @@ -575,7 +591,7 @@
>>>>      int force = 0;
>>>>      char * device_name = NULL;
>>>>      char * jdevice_name = NULL;
>>>> -    unsigned long fs_size = 0;
>>>> +    __u64 fs_size = 0;
>>>>      int c;
>>>>      static int flag;
>>>>  
>>>> @@ -710,7 +726,7 @@
>>>>      
>>>>      if (optind == argc - 2) {
>>>>          /* number of blocks for filesystem is specified */
>>>> -        fs_size = str2int (argv[optind + 1]);
>>>> +        fs_size = str2u64 (argv[optind + 1]);
>>>>      } else if (optind == argc - 1) {
>>>>          /* number of blocks is not specified */
>>>>          if (!(fs_size = misc_device_count_blocks (device_name, Block_size)))
>>>> @@ -719,6 +735,27 @@
>>>>          print_usage_and_exit ();
>>>>      }
>>>>  
>>>> +    if (fs_size >= UINT_MAX) {
>>>> +	fprintf(stderr, ">>> ReiserFS supports file systems of up to %u "
>>>> +	        "blocks.\n>>> The maximum size with a block size of %u bytes "
>>>> +		"is about %Lu MiB.\n>>> This file system would occupy %Lu "
>>>> +		"blocks. ", UINT_MAX, Block_size,
>>>> +		((__u64)UINT_MAX * Block_size) / (1024 * 1024), fs_size);
>>>> +
>>>> +	if (optind == argc - 1) {
>>>> +	    if (!force &&
>>>> +		!util_user_confirmed (stderr, "Truncate? (y/N): ", "y\n")) {
>>>> +		fprintf(stderr, "\nExiting.\n\n");
>>>> +		exit(1);
>>>> +	    }
>>>> +	    fprintf(stderr, "Truncating.\n\n");
>>>> +	    fs_size = UINT_MAX;
>>>> +	} else {
>>>> +	    fprintf(stderr, "Exiting.\n\n");
>>>> +	    exit(1);
>>>> +	}
>>>> +    }
>>>> +
>>>>      if (is_journal_default (device_name, jdevice_name, Block_size))
>>>>          Create_default_journal = 1;
>>>>      
>>>>
> 
> 
> --
> Jeff Mahoney
> SUSE Labs
