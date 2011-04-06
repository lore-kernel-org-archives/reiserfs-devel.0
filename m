From: Serkan Kaba <serkan@gentoo.org>
Subject: Re: File copy problems kde 4.5 to 4.6.1 with reiser4 2.6.38
Date: Wed, 06 Apr 2011 23:07:12 +0300
Message-ID: <4D9CC7F0.5080903@gentoo.org>
References: <201103090918.47762.berny@dwami.com> <4D7774D7.3030908@dwami.com> <4D7FA356.1000309@gmail.com> <201104041142.42496.berny@dwami.com> <BANLkTimmZ4GDX2-K=TaNLOMUg8+C6uyWHQ@mail.gmail.com> <4D9B9875.60400@gmail.com> <4D9BEDAA.6020400@gentoo.org> <BANLkTimNoqZwW=N=5jcMm_C8cTw9ity55g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <BANLkTimNoqZwW=N=5jcMm_C8cTw9ity55g@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-04-2011 21:46, Giuseppe Argentieri wrote:
> 2011/4/6 Serkan Kaba <serkan@gentoo.org>:
> 
>> As we already discussed in ML, this is already an issue for GNOME since
>> 2.30, and I'm using a patched (a patch that doesn't use splice for
>> reiser4 targets) version of glib to workaround this problem.
> 
> Hi Serkan,
> 
> is this the patch you mean?
> http://bugzilla-attachments.gnome.org/attachment.cgi?id=179003
> 
> Against which version of glib should it be applied?
> 
> I could apply it cleanly to the glib-2.28.1 source package from debian
> testing, but the build stopped complaining that 'file' is not declared
> in file_copy_fallback.
> 
> Maybe this line
> 
> +  fsinfo = g_file_query_filesystem_info (file,
> 
> should be replaced by
> 
> +  fsinfo = g_file_query_filesystem_info (source,
> 
> ?
> 
> I really don't know whether it makes sense. Just a guess...
> 
> 
> 
> Cheers
> 
> 
> 
This one has a slight issue please use
http://bugzilla-attachments.gnome.org/attachment.cgi?id=185354

which is actually checking destination not the source.
- -- 
Sincerely,
Serkan KABA
Gentoo Developer
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk2cx/AACgkQRh6X64ivZaKBJQCfQE1gLh3ofYbMYA737SXfgWlT
1JgAn0gwcdQB0brCvk8B/cZX0eyk1Ndm
=eS/B
-----END PGP SIGNATURE-----
