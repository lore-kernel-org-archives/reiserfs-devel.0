From: Nishant Sharma <nishantt@cse.iitd.ernet.in>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files according
 to semantic.
Date: Wed, 17 Mar 2004 13:50:37 +0530
Message-ID: <40580A55.7030809@cse.iitd.ernet.in>
References: <20040317075333.96561.qmail@web60404.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms060407060504060105080706"
Return-path: <reiserfs-list-return-17266-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040317075333.96561.qmail@web60404.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: faraz ahmed <faraz_irulz@yahoo.com>
Cc: reiserfs-list@namesys.com

--------------ms060407060504060105080706
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

faraz ahmed wrote:

>Hi Isaac;
>         The user space implementation u are talking
>about has to be done for each file type seperately.
>Example the Winamp playlist can only organize mp3's
>wherelese our FS can aggregate any type of data
>becuase  each file has attribs (name,value pairs) .
>And the directory listing is done acc Relational
>queryies on these attributes.
>          Anyways the Winamp playlist can only be used
>by winamp & other application have no way to use the
>files organized in a playlist. Where as in our case
>the 
>aggregation is done by the file system, so all apps 
>can use the organization without change.
>
    I wonder if it is possible to put this "plugin infrastructure" in 
the user space rather than kernel
space, by putting it in the glibc implementation. That way, every 
application shall be able to access the
files' metadata information in a transparent manner, and we also get all 
the advantages of the user space.

>          Exactly we do our processing in the user
>space & just display the results under the FS.(Micro
>kernel sorts of)
>                                Regards.
>                                 Faraz.
>
>--- Isaac Claymore <clay@exavio.com.cn> wrote:
>  
>
>>Hi,
>>
>>I'm new to this idea, and am no fs expert. But it
>>looks to me very
>>much like what Apple is doing on their iPods, I
>>happen to have just
>>bought one iPod last weekend.
>>
>>Internally, the audio files are stored on a HFS+
>>filesystem, under a 
>>hierarchy structure very weird to us humans. But, by
>>using iPod or the
>>iTunes tool, the files are presented under various
>>hierachy structures
>>organized by file meta data, like artist, album,
>>composer... And, that's
>>far too convenient.
>>
>>I guess this kind of stuff can be done in user
>>space, well and
>>elegantly. Either a specialized application(e.g.
>>iTunes), or some kind
>>of user space filesystem will do. I also think this
>>is best suited
>>for storage of multimedia files, which naturelly
>>come with much meta
>>data. And, I fail to figure out what benefit this
>>can do to regular
>>system files, like those under /etc, /boot...
>>
>>HTH~~
>>
>>
>>-Isaac
>>
>>On Tue, Mar 16, 2004 at 02:45:23PM -0800, faraz
>>ahmed wrote:
>>    
>>
>>>Hi EveryBody;
>>>Iam an final year engneering student and as part
>>>      
>>>
>>of
>>    
>>
>>>our final year project we have implemented a
>>>filesysten which  
>>>support more than 1 Directory Structures for the
>>>      
>>>
>>same
>>    
>>
>>>set of files. Each Directory Structure is a XML
>>>      
>>>
>>file
>>    
>>
>>>discribing the directory structure as well as the
>>>attributes of the Files to be listed under Each
>>>directory. The file system the mounts this XML
>>>      
>>>
>>file &
>>    
>>
>>>produces the directory listing by querying the FS
>>>      
>>>
>>for
>>    
>>
>>>files which match the criteria. The Project will
>>>      
>>>
>>soon
>>    
>>
>>>be made public under GPL. Following is the
>>>      
>>>
>>abstract.
>>    
>>
>>>Please guide me with your valuable suggestions.
>>>
>>>
>>>//==============================================
>>>1. Idea of our project:
>>>//==============================================
>>>The aim of this project is to implement a solution
>>>that provides file-level host-based virtualization
>>>that provides for better aggregation of
>>>content/information based on semantics and
>>>      
>>>
>>properties.
>>    
>>
>>>File-system organization today very closely
>>>      
>>>
>>mirrors
>>    
>>
>>>storage paradigms rather than user-access
>>>      
>>>
>>paradigms
>>    
>>
>>>and semantic grouping. All file-system hierarchies
>>>      
>>>
>>are
>>    
>>
>>>containers that are expressed based on their
>>>      
>>>
>>physical
>>    
>>
>>>presence (a separate drive letter on Windows, or a
>>>particular mount point based on the volume in
>>>      
>>>
>>Unix). 
>>    
>>
>>>We wish to implement a solution that will allow
>>>      
>>>
>>users
>>    
>>
>>>to organize their files based on their
>>>      
>>>
>>convenience. We
>>    
>>
>>>define this convenience in the following forms: 
>>>
>>>The ability to organize the namespace based on
>>>      
>>>
>>certain
>>    
>>
>>>attribute properties (file-system metadata
>>>virtualization). 
>>>Ex Directory Listing as an output of high level
>>>relational query based on file attributes.
>>>
>>>The ability to de-link position of a file in the
>>>hierarchy from its actual storage (file metadata
>>>virtualization) 
>>>Ex Directory Listing as an output of high level
>>>relational query based on file attributes.
>>>
>>>The ability to de-link position of a file in the
>>>hierarchy from its actual storage (file metadata
>>>virtualization) 
>>>Ex Automatically Listing the files with the proper
>>>attributes in the respective directories. Create &
>>>forget file system now puts your MP3 file in the
>>>      
>>>
>>right
>>    
>>
>>>folder no matter where they are stored on the
>>>      
>>>
>>disk.
>>    
>>
>>>The ability to create and manipulate namespaces
>>>      
>>>
>>using
>>    
>>
>>>well-known metaphors (XML schema descriptions and
>>>schema editors) 
>>>Ex. Define the directory structure with directory
>>>query as an XML file. Mount multiple such
>>>      
>>>
>>directory
>>    
>>
>>>structures (virtualization). There by allowing
>>>multiple organizational views for the same set of
>>>files.
>>>
>>>The ability to continue using the standard
>>>      
>>>
>>metaphors
>>    
>>
>>>for manipulation and access to information
>>>(file-system kernel API?s), thus maintaining
>>>      
>>>
>>current
>>    
>>
>>>large body of applications unbroken) .
>>>Ex. Make all this features available as an
>>>      
>>>
>>standard
>>    
>>
>>>file system so existing apps wont fail
>>>
>>>__________________________________
>>>Do you Yahoo!?
>>>Yahoo! Mail - More reliable, more storage, less
>>>      
>>>
>>spam
>>    
>>
>>>http://mail.yahoo.com
>>>      
>>>
>>-- 
>>
>>Regards, Isaac
>>()  ascii ribbon campaign - against html e-mail
>>/\                        - against microsoft
>>attachments
>>
>>    
>>
>
>  
>
>>ATTACHMENT part 2 application/pgp-signature
>>    
>>
>name=signature.asc
>
>
>
>__________________________________
>Do you Yahoo!?
>Yahoo! Mail - More reliable, more storage, less spam
>http://mail.yahoo.com
>  
>


--------------ms060407060504060105080706
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJHTCC
AukwggJSoAMCAQICAwvIoTANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UE
ChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNv
bmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDQwMjI0MDcxMzIwWhcNMDUwMjIzMDcxMzIw
WjBQMR8wHQYDVQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMS0wKwYJKoZIhvcNAQkBFh5u
aXNoYW50dEBrcml0aWthbHNvbHV0aW9ucy5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQC8aKk7xbEOcIMD4dJxVrxIrA04/l/zDRqcihiMZn6irC6Vnl3HwWbs7HvGFGn9
aRshNygdM1NuLq95uR1ALlvp4Jl4mV/RzJY5AQqBzOVU8m48b/Hi+k7R+R8Pinch3mpa8oT3
txVFncpGqyZNkb6troh8YMIWIU0QePLbzuDixk64pbJuxvwMoVJbOOJx73lmwBJrrUebBpzG
RCDAm2VCXv8wTHAIkxcHOlKWnO+8W8BPW+m7/g14CeHaw5KqPPbbgOuObWsaD78IfuZvmf+0
gjN8DXOebVxQOPv6tcPlTeY4ceO6MSE9cVAY/W9PHij839ofEtjNzlXAl9KQoRunAgMBAAGj
OzA5MCkGA1UdEQQiMCCBHm5pc2hhbnR0QGtyaXRpa2Fsc29sdXRpb25zLmNvbTAMBgNVHRMB
Af8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAK01F4ygkpth2Dlb+x6RPb9J4bhG5Wyc3rkPauSG
hYCUt/A+G1llrMTcikFqXVmGpk03V450T1wgyBvvJmIbY3l4S/SS/h1V4LkjFE+DQiUTqd0k
Wu1qKK/KuMdNYTpT4te0fawSrWwrqCuk3G8mfI1RUacPAQFiQRbJT2b3kFL+MIIC6TCCAlKg
AwIBAgIDC8ihMA0GCSqGSIb3DQEBBAUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3
dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQTAeFw0wNDAyMjQwNzEzMjBaFw0wNTAyMjMwNzEzMjBaMFAxHzAd
BgNVBAMTFlRoYXd0ZSBGcmVlbWFpbCBNZW1iZXIxLTArBgkqhkiG9w0BCQEWHm5pc2hhbnR0
QGtyaXRpa2Fsc29sdXRpb25zLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
ALxoqTvFsQ5wgwPh0nFWvEisDTj+X/MNGpyKGIxmfqKsLpWeXcfBZuzse8YUaf1pGyE3KB0z
U24ur3m5HUAuW+ngmXiZX9HMljkBCoHM5VTybjxv8eL6TtH5Hw+KdyHealryhPe3FUWdykar
Jk2Rvq2uiHxgwhYhTRB48tvO4OLGTrilsm7G/AyhUls44nHveWbAEmutR5sGnMZEIMCbZUJe
/zBMcAiTFwc6Upac77xbwE9b6bv+DXgJ4drDkqo89tuA645taxoPvwh+5m+Z/7SCM3wNc55t
XFA4+/q1w+VN5jhx47oxIT1xUBj9b08eKPzf2h8S2M3OVcCX0pChG6cCAwEAAaM7MDkwKQYD
VR0RBCIwIIEebmlzaGFudHRAa3JpdGlrYWxzb2x1dGlvbnMuY29tMAwGA1UdEwEB/wQCMAAw
DQYJKoZIhvcNAQEEBQADgYEArTUXjKCSm2HYOVv7HpE9v0nhuEblbJzeuQ9q5IaFgJS38D4b
WWWsxNyKQWpdWYamTTdXjnRPXCDIG+8mYhtjeXhL9JL+HVXguSMUT4NCJROp3SRa7Woor8q4
x01hOlPi17R9rBKtbCuoK6TcbyZ8jVFRpw8BAWJBFslPZveQUv4wggM/MIICqKADAgECAgEN
MA0GCSqGSIb3DQEBBQUAMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBl
MRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoTEVRoYXd0ZSBDb25zdWx0aW5nMSgwJgYD
VQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERpdmlzaW9uMSQwIgYDVQQDExtUaGF3dGUg
UGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZyZWVtYWls
QHRoYXd0ZS5jb20wHhcNMDMwNzE3MDAwMDAwWhcNMTMwNzE2MjM1OTU5WjBiMQswCQYDVQQG
EwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMj
VGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwgZ8wDQYJKoZIhvcNAQEBBQAD
gY0AMIGJAoGBAMSmPFVzVftOucqZWh5owHUEcJ3f6f+jHuy9zfVb8hp2vX8MOmHyv1HOAdTl
UAow1wJjWiyJFXCO3cnwK4Vaqj9xVsuvPAsH5/EfkTYkKhPPK9Xzgnc9A74r/rsYPge/QIAC
ZNenprufZdHFKlSFD0gEf6e20TxhBEAeZBlyYLf7AgMBAAGjgZQwgZEwEgYDVR0TAQH/BAgw
BgEB/wIBADBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsLnRoYXd0ZS5jb20vVGhhd3Rl
UGVyc29uYWxGcmVlbWFpbENBLmNybDALBgNVHQ8EBAMCAQYwKQYDVR0RBCIwIKQeMBwxGjAY
BgNVBAMTEVByaXZhdGVMYWJlbDItMTM4MA0GCSqGSIb3DQEBBQUAA4GBAEiM0VCD6gsuzA2j
ZqxnD3+vrL7CF6FDlpSdf0whuPg2H6otnzYvwPQcUCCTcDz9reFhYsPZOhl+hLGZGwDFGguC
dJ4lUJRix9sncVcljd2pnDmOjCBPZV+V2vf3h9bGCE6u9uo05RAaWzVNd+NWIXiC3CEZNd4k
sdMdRv9dX2VPMYIDOzCCAzcCAQEwaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3Rl
IENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIElzc3VpbmcgQ0ECAwvIoTAJBgUrDgMCGgUAoIIBpzAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNDAzMTcwODIwMzdaMCMGCSqGSIb3DQEJBDEWBBSi
2wWEpfhIcN1X22Mr4ULueInGKzBSBgkqhkiG9w0BCQ8xRTBDMAoGCCqGSIb3DQMHMA4GCCqG
SIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDB4Bgkr
BgEEAYI3EAQxazBpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGlu
ZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWlu
ZyBDQQIDC8ihMHoGCyqGSIb3DQEJEAILMWugaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMc
VGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFs
IEZyZWVtYWlsIElzc3VpbmcgQ0ECAwvIoTANBgkqhkiG9w0BAQEFAASCAQBMaWFIe2ISS/al
NyDRICQa5U4OUs5k04GxZNvbWZQtsAkGJPCewyotXQt0CIa8w0+PGYgeU96q9Yb8rNt3VTd8
xVDfPz3vxtewxg5jcvK8VcxU02ZxnpPLsbwytSd5ZKddYj5SV1iRums1OdxDnyTPoX1I131n
FFfr6MBg69OxfXPAYVQo2QMrjNekBMLOS1G75G14l3uvahVjraVZBZiSfYwo1eJuGHLoZJwx
eSDUrJMADNqtNseCqeB2xKaYbcj17NhRDCRKayE3GfAvH7OXvNwzXOqsJkJ6kyV7Dt/WYmXo
9YY1a6wiQ75pzbO4mWz/dESkEBrswA5Fpv3a1ADQAAAAAAAA
--------------ms060407060504060105080706--

