package com.paylocity.employee.karate;


import com.paylocity.employee.karate.utilities.KarateTestExecutor;
import org.junit.jupiter.api.Test;

public class KarateTests {

   @Test
    void test() {
       KarateTestExecutor.executeTests("classpath:", 1);
   }

}
