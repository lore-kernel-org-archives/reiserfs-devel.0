From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: 2.4.21 -> 2.4.25 cryptoloop mess
Date: Mon, 10 Jan 2005 18:23:31 +0300
Message-ID: <200501101823.31273.vitaly@namesys.com>
References: <8944.1105265334@www26.gmx.net> <19024.1105271084@www24.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23107-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <19024.1105271084@www24.gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Danny Norging <norging@gmx.de>, reiserfs-list@namesys.com

On Sunday 09 January 2005 14:44, Danny Norging wrote:
> Hi,
>
> reiserfsck-3.6.19 just finished, still nothing new in lost+found :(
> Thats what I did:
>
> # losetup /dev/loop0 hdc1decrypted.dump
> # reiserfsck --rebuild-tree -S /dev/loop0 -l reiserfsck-3.6.19.log
>
> with the following result:
> # cat reiserfsck-3.6.19.log
> ####### Pass 0 #######
> 28 directory entries were hashed with "r5" hash.
> ####### Pass 1 #######
> ####### Pass 2 #######
> ####### Pass 3 #########
> vpf-10680: The directory [2 3] has the wrong block count in the StatData
> (2) - corrected to (1)
> vpf-10650: The directory [2 3] has the wrong size in the StatData (720) -
> corrected to (48)
> ####### Pass 3a (lost+found pass) #########
> #
>
> still the content of lost+found looks like this:
> # ls -Ral
> .:
> total 2
> drwxr-xr-x  4 root root  80 Nov  4 02:59 .
> drwxr-xr-x  4 root root 192 Nov 18 11:15 ..
> drwx------  4 root root 720 Apr  3  2004 lost+found
>
> ./lost+found:
> total 91
> drwx------  4 root root                 720 Apr  3  2004 .
> drwxr-xr-x  4 root root                  80 Nov  4 02:59 ..
> -rwxr-x---  1 root users                215 Jul 21  2003 1078_1080
> -rwxr-x---  1 root users                385 Jul 21  2003 1081_1082
> -rwxr-x---  1 root users                341 Jul 21  2003 1081_1083
> -rwxr-x---  1 root users                371 Jul 21  2003 1081_1084
> -rwxr-x---  1 root users  12103423998558959 Jul 21  2003 1081_1085
>                           ^^^^^^^^^^^^^^^^^-> quite big, isnt it?
> -rwxr-x---  1 root users                539 Jul 21  2003 1081_1086
> -rwxr-x---  1 root users                407 Jul 21  2003 1081_1087
> -rwxr-x---  1 root users               1844 Jul 21  2003 1081_1088
> -rwxrwxrwx  1 dg   users               4000 Jul 24  2003 38910_45033
> -rwxrwxrwx  1 dg   users               2425 Jul 24  2003 38910_45034
> -rwxrwxrwx  1 dg   users               2865 Oct 23  2002 58627_65589
> -rwxrwxrwx  1 dg   users              11313 Aug  5  2003 92166_92185
> -rwxrwxrwx  1 dg   users                660 Aug  5  2003 92167_92168
> -rwxrwxrwx  1 dg   users                 20 Aug  5  2003 92167_92169
> -rwxrwxrwx  1 dg   users                 50 Aug  5  2003 92167_92170
> drwxrwxrwt  2 dg   users                104 Aug  5  2003 92186_92187
> -rwxrwxrwx  1 dg   users                  2 Aug  5  2003 92187_92188
> drwxrwxrwt  2 dg   users                128 Aug  5  2003 92191_92192
> -rwxrwxrwx  1 dg   users                536 Aug  5  2003 92196_92201
> -rwxrwxrwx  1 dg   users              12587 Aug  5  2003 92196_92202
> -rwxrwxrwx  1 dg   users 742249513586003637 Aug  5  2003 92196_92203
>                          ^^^^^^^^^^^^^^^^^^ ???
> ./lost+found/92186_92187:
> total 10
> drwxrwxrwt  2 dg   users 104 Aug  5  2003 .
> drwx------  4 root root  720 Apr  3  2004 ..
> -rwxrwxrwx  1 dg   users  24 Aug  5  2003 Repository
> -rwxrwxrwx  1 dg   users  50 Aug  5  2003 Root
>
> ./lost+found/92191_92192:
> total 14
> drwxrwxrwt  2 dg   users 128 Aug  5  2003 .
> drwx------  4 root root  720 Apr  3  2004 ..
> -rwxrwxrwx  1 dg   users   2 Aug  5  2003 Entries
> -rwxrwxrwx  1 dg   users  19 Aug  5  2003 Repository
> -rwxrwxrwx  1 dg   users  50 Aug  5  2003 Root
> #
>
> and look at this:
> # du 1081_1085 92196_92203
> 4       1081_1085
> 4       92196_92203
> #
>
> Any help? TIA

I have been reported about a similar crypto problem recently, when after 
upgrade and attempt to continue using the fs, first 4 bytes of many block 
get altered. Probably your case is a similar one. If you have provided me 
an access to the fs (restored from the backup) and I have confirmed the idea, 
I could probably write a hack to pull out more data.

-- 
Thanks,
Vitaly Fertman


