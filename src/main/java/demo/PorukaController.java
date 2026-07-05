package demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PorukaController {

    @GetMapping("/api/poruka")
    public String vrati_poruku(){
        return "CI/CD radi! Ovo je verzija nase aplikacije pod nazivom v1!!!";
    }
}
