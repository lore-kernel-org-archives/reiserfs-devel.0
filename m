From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Fwd: [PATCH] reiserfsck: support `fsck -f -n`
Date: Thu, 11 Oct 2012 11:55:39 -0400
Message-ID: <5076EBFB.4000208@suse.com>
References: <1232209168-25857-1-git-send-email-vapier@gentoo.org> <50759633.2060806@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <50759633.2060806@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10/10/12 11:37 AM, Edward Shishkin wrote:
> 
> 
> 
> -------- Original Message -------- Subject: 	[PATCH] reiserfsck:
> support `fsck -f -n` Date: 	Sat, 17 Jan 2009 11:19:28 -0500 From:
> Mike Frysinger <vapier@gentoo.org> To:
> reiserfs-devel@vger.kernel.org CC: 	Roy Marples <roy@marples.name>
> 
> 
> 
> From: Roy Marples <roy@marples.name>
> 
> Every other fsck util out there supports non-interactive forcing
> and this change brings reiserfsck into line.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org> --- fsck/main.c |
> 5 +++-- 1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fsck/main.c b/fsck/main.c index 06d7bd2..cfee979
> 100644 --- a/fsck/main.c +++ b/fsck/main.c @@ -421,8 +421,9 @@ void
> warn_what_will_be_done (char * file_name, struct fsck_data * data) 
> (data->log == stdout) ? "stdout" : (data->log_file_name ?
> data->log_file_name : "fsck.run"));
> 
> -    if (!(data->options & OPT_YES) && !user_confirmed (warn_to,
> "\nDo you want to " -	"run this program?[N/Yes] (note need to type
> Yes if you do):", "Yes\n")) +    if (!(data->options & OPT_YES) &&
> !(data->options & OPT_SILENT) && +	!user_confirmed (warn_to, "\nDo
> you want to run this program?[N/Yes] " +	"(note need to type Yes if
> you do):", "Yes\n")) exit (EXIT_USER); }
> 

This one needs a Signed-off-by from the original author. I've emailed
him to request it.

- -Jeff


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.18 (Darwin)
Comment: GPGTools - http://gpgtools.org
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQIcBAEBAgAGBQJQduv7AAoJEB57S2MheeWyyFUP/29aTygqB3d61LOTA5YxFTFf
7AR9DJodJoUohHUKvUtQ5LDI+PZV92kBAV+H7trRnhiNE0tvveRd9jdBqStGhLoZ
o88KFxbqCD2s9O0BDn0tfB+Jc1aNQxmoHa3wXehVAoncJrIMtc2NHDp8qac/3m5L
5j5ATgCoTo7pNKG8UMaRRadiqL9qp7h9sS72yJmKMJQdNkhAsrpJnZWwMjI2sPOz
TZRwWah0HW13l9hqtCKY5quMD2SXDuvu3yaavEpTAg2p1YNBuFTtOua2S/tyTos6
kvzA0tI/h1VbVoL8jhBX4Dmhh37+/F3/TOrWB4tKRpS7AjyaMvaGeaYhk2EAlSzt
ZY46Wy5PmVo9opkKwHk/QflTPpSjMNeaxEYskQYmuTmYH/rc1xlU/lVdAH/oCAIf
WF7XSl48i9enI8k5kKB2/j3BWVvqU4APYY/w35O+yfQHLPuGfw2N6mPOATZhPU5U
6o9JFi7ihwe7Px/msYdvF9dqT3V+ffgcU63wtSbQVdvkSpVoTIREWz2BknLW/Q5a
9Qt27/5G2a0AMyUWro98CA1f+b3YfHAm/+Kn4Acqjqztj/k3S97n1vOBmNqT/cvX
pE9WyTbYPl5DNlOB363V5/yCjpFhTt3CoqzJ6ar0jQcVeSzeoaYm/dwXwzZ5AUjZ
WHnUHyMGgpM6XrPWhxps
=HkXe
-----END PGP SIGNATURE-----
